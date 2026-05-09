; DESCRIPTION: Renders a purple disk with center (254, 225) and radius 10.
; PLAN: r0=254(x), r1=225(y), r2=10(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 254
LDI r1, 225
LDI r2, 10
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
