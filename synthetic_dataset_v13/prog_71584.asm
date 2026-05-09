; DESCRIPTION: Composite: Sets a single red pixel at (283, 30) then Places a magenta line segment connecting (339, 172) to (104, 198).
; PLAN: r0=283(x), r1=30(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=339(x1), r6=172(y1), r7=104(x2), r8=198(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 283
LDI r1, 30
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 339
LDI r6, 172
LDI r7, 104
LDI r8, 198
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
HALT
