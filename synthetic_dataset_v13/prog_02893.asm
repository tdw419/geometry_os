; DESCRIPTION: Composite: Sets a single black pixel at (33, 182) then Places a purple line segment connecting (325, 203) to (509, 35).
; PLAN: r0=33(x), r1=182(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=325(x1), r6=203(y1), r7=509(x2), r8=35(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 33
LDI r1, 182
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 325
LDI r6, 203
LDI r7, 509
LDI r8, 35
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
HALT
