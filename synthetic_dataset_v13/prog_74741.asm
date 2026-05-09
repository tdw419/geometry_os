; DESCRIPTION: Composite: Places a green line segment connecting (215, 151) to (323, 241) then Sets a single orange pixel at (342, 198).
; PLAN: r0=215(x1), r1=151(y1), r2=323(x2), r3=241(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=342(x), r6=198(y), r7=0xFF8800(color). Op: PSET r5, r6, r7.
LDI r0, 215
LDI r1, 151
LDI r2, 323
LDI r3, 241
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 342
LDI r6, 198
LDI r7, 0xFF8800
PSET r5, r6, r7
HALT
