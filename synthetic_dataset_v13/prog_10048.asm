; DESCRIPTION: Renders a red disk with center (89, 88) and radius 66.
; PLAN: r0=89(x), r1=88(y), r2=66(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 89
LDI r1, 88
LDI r2, 66
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
