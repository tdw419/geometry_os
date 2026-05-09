; DESCRIPTION: Renders a purple disk with center (329, 112) and radius 56.
; PLAN: r0=329(x), r1=112(y), r2=56(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 329
LDI r1, 112
LDI r2, 56
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
