; DESCRIPTION: Renders a orange disk with center (424, 140) and radius 51.
; PLAN: r0=424(x), r1=140(y), r2=51(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 424
LDI r1, 140
LDI r2, 51
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
