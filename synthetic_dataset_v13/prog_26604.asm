; DESCRIPTION: Renders a red disk with center (459, 51) and radius 11.
; PLAN: r0=459(x), r1=51(y), r2=11(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 459
LDI r1, 51
LDI r2, 11
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
