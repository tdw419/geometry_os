; DESCRIPTION: Renders a black disk with center (172, 151) and radius 56.
; PLAN: r0=172(x), r1=151(y), r2=56(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 172
LDI r1, 151
LDI r2, 56
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
