; DESCRIPTION: Renders a white disk with center (408, 194) and radius 51.
; PLAN: r0=408(x), r1=194(y), r2=51(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 408
LDI r1, 194
LDI r2, 51
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
