; DESCRIPTION: Renders a red disk with center (389, 105) and radius 56.
; PLAN: r0=389(x), r1=105(y), r2=56(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 389
LDI r1, 105
LDI r2, 56
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
