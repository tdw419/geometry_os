; DESCRIPTION: Composite: Places a orange dot at position (379, 229) then Places a purple line segment connecting (411, 83) to (94, 2).
; PLAN: r0=379(x), r1=229(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=411(x1), r6=83(y1), r7=94(x2), r8=2(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 379
LDI r1, 229
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 411
LDI r6, 83
LDI r7, 94
LDI r8, 2
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
HALT
