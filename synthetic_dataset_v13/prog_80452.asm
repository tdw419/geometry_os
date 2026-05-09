; DESCRIPTION: Composite: Draws a red line from (63, 205) to (424, 89) then Sets a single green pixel at (109, 221).
; PLAN: r0=63(x1), r1=205(y1), r2=424(x2), r3=89(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=109(x), r6=221(y), r7=0x00FF00(color). Op: PSET r5, r6, r7.
LDI r0, 63
LDI r1, 205
LDI r2, 424
LDI r3, 89
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 109
LDI r6, 221
LDI r7, 0x00FF00
PSET r5, r6, r7
HALT
