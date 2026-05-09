; DESCRIPTION: Renders a black disk with center (323, 164) and radius 10.
; PLAN: r0=323(x), r1=164(y), r2=10(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 323
LDI r1, 164
LDI r2, 10
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
