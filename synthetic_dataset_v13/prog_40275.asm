; DESCRIPTION: Composite: Sets a single blue pixel at (396, 109) then Draws a orange line from (57, 102) to (367, 234).
; PLAN: r0=396(x), r1=109(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=57(x1), r6=102(y1), r7=367(x2), r8=234(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 396
LDI r1, 109
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 57
LDI r6, 102
LDI r7, 367
LDI r8, 234
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
HALT
