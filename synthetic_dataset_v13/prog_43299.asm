; DESCRIPTION: Renders a red disk with center (88, 118) and radius 72.
; PLAN: r0=88(x), r1=118(y), r2=72(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 88
LDI r1, 118
LDI r2, 72
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
