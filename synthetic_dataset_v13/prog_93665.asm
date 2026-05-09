; DESCRIPTION: Composite: Sets a single black pixel at (399, 106) then Places a magenta line segment connecting (147, 153) to (313, 138).
; PLAN: r0=399(x), r1=106(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=147(x1), r6=153(y1), r7=313(x2), r8=138(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 399
LDI r1, 106
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 147
LDI r6, 153
LDI r7, 313
LDI r8, 138
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
HALT
