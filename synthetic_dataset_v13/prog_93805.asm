; DESCRIPTION: Composite: Places a purple dot at position (7, 220) then Draws a magenta line from (106, 248) to (186, 211).
; PLAN: r0=7(x), r1=220(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=106(x1), r6=248(y1), r7=186(x2), r8=211(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 7
LDI r1, 220
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 106
LDI r6, 248
LDI r7, 186
LDI r8, 211
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
HALT
