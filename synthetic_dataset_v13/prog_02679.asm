; DESCRIPTION: Renders a black disk with center (248, 120) and radius 75.
; PLAN: r0=248(x), r1=120(y), r2=75(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 248
LDI r1, 120
LDI r2, 75
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
