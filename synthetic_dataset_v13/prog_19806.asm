; DESCRIPTION: Renders a purple disk with center (110, 210) and radius 10.
; PLAN: r0=110(x), r1=210(y), r2=10(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 110
LDI r1, 210
LDI r2, 10
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
