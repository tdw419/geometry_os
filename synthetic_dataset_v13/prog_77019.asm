; DESCRIPTION: Composite: Renders a green disk with center (137, 89) and radius 79 then Sets a single cyan pixel at (13, 203).
; PLAN: r0=137(x), r1=89(y), r2=79(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=13(x), r6=203(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7.
LDI r0, 137
LDI r1, 89
LDI r2, 79
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 13
LDI r6, 203
LDI r7, 0x00FFFF
PSET r5, r6, r7
HALT
