; DESCRIPTION: Renders a purple disk with center (461, 63) and radius 50.
; PLAN: r0=461(x), r1=63(y), r2=50(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 461
LDI r1, 63
LDI r2, 50
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
