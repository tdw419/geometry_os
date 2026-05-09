; DESCRIPTION: Renders a red disk with center (341, 105) and radius 70.
; PLAN: r0=341(x), r1=105(y), r2=70(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 341
LDI r1, 105
LDI r2, 70
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
