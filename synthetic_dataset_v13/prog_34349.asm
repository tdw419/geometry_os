; DESCRIPTION: Composite: Renders a orange line between points (126, 202) and (158, 126) then Sets a single red pixel at (149, 246).
; PLAN: r0=126(x1), r1=202(y1), r2=158(x2), r3=126(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=149(x), r6=246(y), r7=0xFF0000(color). Op: PSET r5, r6, r7.
LDI r0, 126
LDI r1, 202
LDI r2, 158
LDI r3, 126
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 149
LDI r6, 246
LDI r7, 0xFF0000
PSET r5, r6, r7
HALT
