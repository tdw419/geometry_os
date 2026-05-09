; DESCRIPTION: Creates a green rectangular region at (332, 122) spanning 14 by 56 pixels.
; PLAN: r0=332(x), r1=122(y), r2=14(width), r3=56(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 332
LDI r1, 122
LDI r2, 14
LDI r3, 56
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
