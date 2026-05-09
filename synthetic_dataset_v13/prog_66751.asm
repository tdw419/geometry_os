; DESCRIPTION: Composite: Places a magenta dot at position (147, 201) then Draws a red line from (461, 178) to (146, 156).
; PLAN: r0=147(x), r1=201(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=461(x1), r6=178(y1), r7=146(x2), r8=156(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 147
LDI r1, 201
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 461
LDI r6, 178
LDI r7, 146
LDI r8, 156
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
HALT
