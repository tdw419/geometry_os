; DESCRIPTION: Composite: Places a black dot at position (459, 182) then Draws a blue line from (147, 178) to (402, 249).
; PLAN: r0=459(x), r1=182(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=147(x1), r6=178(y1), r7=402(x2), r8=249(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 459
LDI r1, 182
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 147
LDI r6, 178
LDI r7, 402
LDI r8, 249
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
HALT
