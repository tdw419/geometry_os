; DESCRIPTION: Creates a green rectangular region at (63, 88) spanning 84 by 97 pixels.
; PLAN: r0=63(x), r1=88(y), r2=84(width), r3=97(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 63
LDI r1, 88
LDI r2, 84
LDI r3, 97
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
