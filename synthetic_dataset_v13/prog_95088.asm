; DESCRIPTION: Composite: Sets a single blue pixel at (475, 169) then Draws a magenta line from (439, 223) to (10, 12).
; PLAN: r0=475(x), r1=169(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=439(x1), r6=223(y1), r7=10(x2), r8=12(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 475
LDI r1, 169
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 439
LDI r6, 223
LDI r7, 10
LDI r8, 12
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
HALT
