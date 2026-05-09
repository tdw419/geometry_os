; DESCRIPTION: Composite: Places a orange dot at position (364, 38) then Places a yellow line segment connecting (43, 188) to (116, 90).
; PLAN: r0=364(x), r1=38(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=43(x1), r6=188(y1), r7=116(x2), r8=90(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 364
LDI r1, 38
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 43
LDI r6, 188
LDI r7, 116
LDI r8, 90
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
HALT
