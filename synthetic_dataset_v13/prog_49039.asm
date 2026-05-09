; DESCRIPTION: Renders a blue box of size 17x23 starting at (390, 129).
; PLAN: r0=390(x), r1=129(y), r2=17(width), r3=23(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 390
LDI r1, 129
LDI r2, 17
LDI r3, 23
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
