; DESCRIPTION: Creates a yellow rectangular region at (151, 77) spanning 73 by 88 pixels.
; PLAN: r0=151(x), r1=77(y), r2=73(width), r3=88(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 151
LDI r1, 77
LDI r2, 73
LDI r3, 88
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
