; DESCRIPTION: Renders a orange disk with center (427, 131) and radius 73.
; PLAN: r0=427(x), r1=131(y), r2=73(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 427
LDI r1, 131
LDI r2, 73
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
