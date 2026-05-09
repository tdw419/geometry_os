; DESCRIPTION: Composite: Places a orange dot at position (73, 148) then Draws a orange line from (204, 207) to (293, 248).
; PLAN: r0=73(x), r1=148(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=204(x1), r6=207(y1), r7=293(x2), r8=248(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 73
LDI r1, 148
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 204
LDI r6, 207
LDI r7, 293
LDI r8, 248
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
HALT
