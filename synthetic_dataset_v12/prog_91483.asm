; DESCRIPTION: Composite: Sets a single orange pixel at (155, 138) then Draws a orange line from (131, 214) to (308, 118).
; PLAN: r0=155(x), r1=138(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=131(x1), r6=214(y1), r7=308(x2), r8=118(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 155
LDI r1, 138
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 131
LDI r6, 214
LDI r7, 308
LDI r8, 118
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
HALT
