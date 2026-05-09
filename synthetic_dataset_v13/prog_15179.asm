; DESCRIPTION: Composite: Draws a red line from (307, 145) to (43, 131) then Sets a single purple pixel at (166, 246).
; PLAN: r0=307(x1), r1=145(y1), r2=43(x2), r3=131(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=166(x), r6=246(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7.
LDI r0, 307
LDI r1, 145
LDI r2, 43
LDI r3, 131
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 166
LDI r6, 246
LDI r7, 0xAA00FF
PSET r5, r6, r7
HALT
