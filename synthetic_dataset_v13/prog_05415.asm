; DESCRIPTION: Renders a blue box of size 110x21 starting at (106, 130).
; PLAN: r0=106(x), r1=130(y), r2=110(width), r3=21(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 106
LDI r1, 130
LDI r2, 110
LDI r3, 21
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
