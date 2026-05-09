; DESCRIPTION: Renders a purple disk with center (338, 66) and radius 46.
; PLAN: r0=338(x), r1=66(y), r2=46(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 338
LDI r1, 66
LDI r2, 46
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
