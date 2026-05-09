; DESCRIPTION: Renders a red disk with center (81, 138) and radius 75.
; PLAN: r0=81(x), r1=138(y), r2=75(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 81
LDI r1, 138
LDI r2, 75
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
