; DESCRIPTION: Composite: Places a black dot at position (490, 167) then Draws a magenta line from (241, 205) to (138, 147).
; PLAN: r0=490(x), r1=167(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=241(x1), r6=205(y1), r7=138(x2), r8=147(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 490
LDI r1, 167
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 241
LDI r6, 205
LDI r7, 138
LDI r8, 147
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
HALT
