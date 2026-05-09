; DESCRIPTION: Creates a green rectangular region at (200, 86) spanning 119 by 105 pixels.
; PLAN: r0=200(x), r1=86(y), r2=119(width), r3=105(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 200
LDI r1, 86
LDI r2, 119
LDI r3, 105
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
