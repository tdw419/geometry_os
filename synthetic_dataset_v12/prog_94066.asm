; DESCRIPTION: Renders a red disk with center (100, 75) and radius 26.
; PLAN: r0=100(x), r1=75(y), r2=26(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 100
LDI r1, 75
LDI r2, 26
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
