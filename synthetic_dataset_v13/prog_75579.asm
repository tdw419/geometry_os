; DESCRIPTION: Composite: Draws a green line from (156, 49) to (146, 41) then Sets a single yellow pixel at (363, 208).
; PLAN: r0=156(x1), r1=49(y1), r2=146(x2), r3=41(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=363(x), r6=208(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7.
LDI r0, 156
LDI r1, 49
LDI r2, 146
LDI r3, 41
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 363
LDI r6, 208
LDI r7, 0xFFFF00
PSET r5, r6, r7
HALT
