; DESCRIPTION: Renders a blue disk with center (399, 55) and radius 52.
; PLAN: r0=399(x), r1=55(y), r2=52(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 399
LDI r1, 55
LDI r2, 52
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
