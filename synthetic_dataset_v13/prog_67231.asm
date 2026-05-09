; DESCRIPTION: Composite: Places a black line segment connecting (323, 2) to (331, 234) then Sets a single green pixel at (406, 1).
; PLAN: r0=323(x1), r1=2(y1), r2=331(x2), r3=234(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=406(x), r6=1(y), r7=0x00FF00(color). Op: PSET r5, r6, r7.
LDI r0, 323
LDI r1, 2
LDI r2, 331
LDI r3, 234
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 406
LDI r6, 1
LDI r7, 0x00FF00
PSET r5, r6, r7
HALT
