; DESCRIPTION: Renders a purple disk with center (463, 215) and radius 10.
; PLAN: r0=463(x), r1=215(y), r2=10(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 463
LDI r1, 215
LDI r2, 10
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
