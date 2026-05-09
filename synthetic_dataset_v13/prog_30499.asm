; DESCRIPTION: Renders a purple disk with center (252, 122) and radius 23.
; PLAN: r0=252(x), r1=122(y), r2=23(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 252
LDI r1, 122
LDI r2, 23
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
