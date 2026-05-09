; DESCRIPTION: Composite: Renders a white line between points (468, 154) and (395, 167) then Sets a single yellow pixel at (325, 222).
; PLAN: r0=468(x1), r1=154(y1), r2=395(x2), r3=167(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=325(x), r6=222(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7.
LDI r0, 468
LDI r1, 154
LDI r2, 395
LDI r3, 167
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 325
LDI r6, 222
LDI r7, 0xFFFF00
PSET r5, r6, r7
HALT
