; DESCRIPTION: Creates a green rectangular region at (357, 144) spanning 118 by 86 pixels.
; PLAN: r0=357(x), r1=144(y), r2=118(width), r3=86(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 357
LDI r1, 144
LDI r2, 118
LDI r3, 86
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
