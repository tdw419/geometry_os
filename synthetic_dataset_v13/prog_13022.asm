; DESCRIPTION: Renders a orange disk with center (389, 81) and radius 73.
; PLAN: r0=389(x), r1=81(y), r2=73(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 389
LDI r1, 81
LDI r2, 73
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
