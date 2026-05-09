; DESCRIPTION: Composite: Sets a single orange pixel at (377, 247) then Draws a red line from (107, 213) to (311, 96).
; PLAN: r0=377(x), r1=247(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=107(x1), r6=213(y1), r7=311(x2), r8=96(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 377
LDI r1, 247
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 107
LDI r6, 213
LDI r7, 311
LDI r8, 96
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
HALT
