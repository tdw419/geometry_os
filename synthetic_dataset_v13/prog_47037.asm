; DESCRIPTION: Renders a red disk with center (411, 201) and radius 15.
; PLAN: r0=411(x), r1=201(y), r2=15(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 411
LDI r1, 201
LDI r2, 15
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
