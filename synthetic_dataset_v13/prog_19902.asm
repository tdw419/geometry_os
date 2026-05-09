; DESCRIPTION: Renders a black disk with center (219, 177) and radius 65.
; PLAN: r0=219(x), r1=177(y), r2=65(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 219
LDI r1, 177
LDI r2, 65
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
