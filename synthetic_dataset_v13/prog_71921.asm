; DESCRIPTION: Renders a black disk with center (389, 151) and radius 70.
; PLAN: r0=389(x), r1=151(y), r2=70(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 389
LDI r1, 151
LDI r2, 70
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
