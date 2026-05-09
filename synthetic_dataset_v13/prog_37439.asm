; DESCRIPTION: Renders a purple disk with center (270, 185) and radius 50.
; PLAN: r0=270(x), r1=185(y), r2=50(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 270
LDI r1, 185
LDI r2, 50
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
