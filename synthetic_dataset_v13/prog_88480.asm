; DESCRIPTION: Creates a red rectangular region at (205, 17) spanning 38 by 33 pixels.
; PLAN: r0=205(x), r1=17(y), r2=38(width), r3=33(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 205
LDI r1, 17
LDI r2, 38
LDI r3, 33
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
