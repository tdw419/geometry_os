; DESCRIPTION: Renders a red disk with center (286, 100) and radius 25.
; PLAN: r0=286(x), r1=100(y), r2=25(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 286
LDI r1, 100
LDI r2, 25
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
