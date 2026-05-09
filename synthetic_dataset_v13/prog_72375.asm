; DESCRIPTION: Renders a black disk with center (106, 151) and radius 77.
; PLAN: r0=106(x), r1=151(y), r2=77(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 106
LDI r1, 151
LDI r2, 77
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
