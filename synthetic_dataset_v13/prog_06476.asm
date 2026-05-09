; DESCRIPTION: Composite: Renders a yellow line between points (452, 150) and (241, 252) then Sets a single green pixel at (314, 229).
; PLAN: r0=452(x1), r1=150(y1), r2=241(x2), r3=252(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=314(x), r6=229(y), r7=0x00FF00(color). Op: PSET r5, r6, r7.
LDI r0, 452
LDI r1, 150
LDI r2, 241
LDI r3, 252
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 314
LDI r6, 229
LDI r7, 0x00FF00
PSET r5, r6, r7
HALT
