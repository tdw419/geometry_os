; DESCRIPTION: Composite: Sets a single purple pixel at (172, 218) then Renders a cyan line between points (144, 188) and (316, 188).
; PLAN: r0=172(x), r1=218(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=144(x1), r6=188(y1), r7=316(x2), r8=188(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 172
LDI r1, 218
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 144
LDI r6, 188
LDI r7, 316
LDI r8, 188
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
HALT
