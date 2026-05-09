; DESCRIPTION: Renders a purple disk with center (300, 63) and radius 45.
; PLAN: r0=300(x), r1=63(y), r2=45(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 300
LDI r1, 63
LDI r2, 45
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
