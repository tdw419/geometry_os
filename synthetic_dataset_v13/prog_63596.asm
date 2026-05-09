; DESCRIPTION: Composite: Renders a cyan line between points (61, 71) and (300, 211) then Sets a single blue pixel at (402, 201) then Renders a black disk with center (134, 132) and radius 75.
; PLAN: r0=61(x1), r1=71(y1), r2=300(x2), r3=211(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=402(x), r6=201(y), r7=0x0000FF(color). Op: PSET r5, r6, r7 Next: r10=134(x), r11=132(y), r12=75(radius), r13=0x000000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 61
LDI r1, 71
LDI r2, 300
LDI r3, 211
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 402
LDI r6, 201
LDI r7, 0x0000FF
PSET r5, r6, r7
LDI r10, 134
LDI r11, 132
LDI r12, 75
LDI r13, 0x000000
CIRCLE r10, r11, r12, r13
HALT
