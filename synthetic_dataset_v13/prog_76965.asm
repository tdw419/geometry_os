; DESCRIPTION: Composite: Places a purple dot at position (37, 34) then Draws a magenta line from (17, 180) to (361, 249).
; PLAN: r0=37(x), r1=34(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=17(x1), r6=180(y1), r7=361(x2), r8=249(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 37
LDI r1, 34
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 17
LDI r6, 180
LDI r7, 361
LDI r8, 249
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
HALT
