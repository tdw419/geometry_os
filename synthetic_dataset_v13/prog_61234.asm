; DESCRIPTION: Composite: Sets a single blue pixel at (173, 1) then Places a purple line segment connecting (204, 156) to (341, 123).
; PLAN: r0=173(x), r1=1(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=204(x1), r6=156(y1), r7=341(x2), r8=123(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 173
LDI r1, 1
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 204
LDI r6, 156
LDI r7, 341
LDI r8, 123
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
HALT
