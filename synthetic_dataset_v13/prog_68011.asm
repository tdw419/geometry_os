; DESCRIPTION: Renders a purple disk with center (432, 209) and radius 11.
; PLAN: r0=432(x), r1=209(y), r2=11(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 432
LDI r1, 209
LDI r2, 11
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
