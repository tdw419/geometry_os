; DESCRIPTION: Composite: Places a orange dot at position (266, 82) then Draws a magenta line from (315, 123) to (486, 19).
; PLAN: r0=266(x), r1=82(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=315(x1), r6=123(y1), r7=486(x2), r8=19(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 266
LDI r1, 82
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 315
LDI r6, 123
LDI r7, 486
LDI r8, 19
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
HALT
