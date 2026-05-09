; DESCRIPTION: Composite: Sets a single black pixel at (67, 179) then Places a red line segment connecting (353, 169) to (36, 203).
; PLAN: r0=67(x), r1=179(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=353(x1), r6=169(y1), r7=36(x2), r8=203(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 67
LDI r1, 179
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 353
LDI r6, 169
LDI r7, 36
LDI r8, 203
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
HALT
