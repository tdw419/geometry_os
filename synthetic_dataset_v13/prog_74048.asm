; DESCRIPTION: Renders a blue disk with center (402, 187) and radius 68.
; PLAN: r0=402(x), r1=187(y), r2=68(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 402
LDI r1, 187
LDI r2, 68
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
