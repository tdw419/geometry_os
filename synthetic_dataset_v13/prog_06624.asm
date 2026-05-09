; DESCRIPTION: Composite: Places a red dot at position (363, 167) then Draws a purple line from (12, 104) to (371, 183).
; PLAN: r0=363(x), r1=167(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=12(x1), r6=104(y1), r7=371(x2), r8=183(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 363
LDI r1, 167
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 12
LDI r6, 104
LDI r7, 371
LDI r8, 183
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
HALT
