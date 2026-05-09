; DESCRIPTION: Composite: Draws a red line from (97, 103) to (89, 68) then Places a black dot at position (106, 94).
; PLAN: r0=97(x1), r1=103(y1), r2=89(x2), r3=68(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=106(x), r6=94(y), r7=0x000000(color). Op: PSET r5, r6, r7.
LDI r0, 97
LDI r1, 103
LDI r2, 89
LDI r3, 68
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 106
LDI r6, 94
LDI r7, 0x000000
PSET r5, r6, r7
HALT
