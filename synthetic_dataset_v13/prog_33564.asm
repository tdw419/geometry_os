; DESCRIPTION: Creates a green rectangular region at (84, 98) spanning 88 by 19 pixels.
; PLAN: r0=84(x), r1=98(y), r2=88(width), r3=19(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 84
LDI r1, 98
LDI r2, 88
LDI r3, 19
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
