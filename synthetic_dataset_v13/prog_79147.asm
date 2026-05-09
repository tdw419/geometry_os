; DESCRIPTION: Composite: Sets a single purple pixel at (189, 190) then Places a yellow line segment connecting (147, 137) to (327, 36).
; PLAN: r0=189(x), r1=190(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=147(x1), r6=137(y1), r7=327(x2), r8=36(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 189
LDI r1, 190
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 147
LDI r6, 137
LDI r7, 327
LDI r8, 36
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
HALT
