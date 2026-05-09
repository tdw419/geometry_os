; DESCRIPTION: Composite: Sets a single black pixel at (218, 252) then Places a magenta line segment connecting (483, 174) to (35, 20).
; PLAN: r0=218(x), r1=252(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=483(x1), r6=174(y1), r7=35(x2), r8=20(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 218
LDI r1, 252
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 483
LDI r6, 174
LDI r7, 35
LDI r8, 20
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
HALT
