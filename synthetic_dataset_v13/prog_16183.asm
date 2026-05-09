; DESCRIPTION: Renders a purple disk with center (136, 150) and radius 50.
; PLAN: r0=136(x), r1=150(y), r2=50(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 136
LDI r1, 150
LDI r2, 50
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
