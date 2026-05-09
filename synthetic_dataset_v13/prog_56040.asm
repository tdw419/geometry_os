; DESCRIPTION: Renders a purple disk with center (318, 164) and radius 54.
; PLAN: r0=318(x), r1=164(y), r2=54(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 318
LDI r1, 164
LDI r2, 54
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
