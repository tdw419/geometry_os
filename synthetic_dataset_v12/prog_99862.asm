; DESCRIPTION: Creates a green rectangular region at (130, 15) spanning 89 by 119 pixels.
; PLAN: r0=130(x), r1=15(y), r2=89(width), r3=119(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 130
LDI r1, 15
LDI r2, 89
LDI r3, 119
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
