; DESCRIPTION: Renders a purple disk with center (326, 106) and radius 63.
; PLAN: r0=326(x), r1=106(y), r2=63(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 326
LDI r1, 106
LDI r2, 63
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
