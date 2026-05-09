; DESCRIPTION: Renders a black disk with center (333, 177) and radius 55.
; PLAN: r0=333(x), r1=177(y), r2=55(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 333
LDI r1, 177
LDI r2, 55
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
