; DESCRIPTION: Renders a purple disk with center (291, 164) and radius 66.
; PLAN: r0=291(x), r1=164(y), r2=66(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 291
LDI r1, 164
LDI r2, 66
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
