; DESCRIPTION: Creates a red rectangular region at (77, 17) spanning 73 by 45 pixels.
; PLAN: r0=77(x), r1=17(y), r2=73(width), r3=45(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 77
LDI r1, 17
LDI r2, 73
LDI r3, 45
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
