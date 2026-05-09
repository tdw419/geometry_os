; DESCRIPTION: Creates a red rectangular region at (77, 19) spanning 57 by 35 pixels.
; PLAN: r0=77(x), r1=19(y), r2=57(width), r3=35(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 77
LDI r1, 19
LDI r2, 57
LDI r3, 35
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
