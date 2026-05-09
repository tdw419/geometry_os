; DESCRIPTION: Composite: Renders a yellow line between points (329, 98) and (364, 58) then Sets a single orange pixel at (321, 136).
; PLAN: r0=329(x1), r1=98(y1), r2=364(x2), r3=58(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=321(x), r6=136(y), r7=0xFF8800(color). Op: PSET r5, r6, r7.
LDI r0, 329
LDI r1, 98
LDI r2, 364
LDI r3, 58
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 321
LDI r6, 136
LDI r7, 0xFF8800
PSET r5, r6, r7
HALT
