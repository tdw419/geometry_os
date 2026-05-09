; DESCRIPTION: Renders a yellow disk with center (341, 96) and radius 19.
; PLAN: r0=341(x), r1=96(y), r2=19(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 341
LDI r1, 96
LDI r2, 19
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
