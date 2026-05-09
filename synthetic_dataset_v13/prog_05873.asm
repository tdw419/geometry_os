; DESCRIPTION: Composite: Sets a single purple pixel at (414, 173) then Places a green line segment connecting (453, 155) to (496, 50).
; PLAN: r0=414(x), r1=173(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=453(x1), r6=155(y1), r7=496(x2), r8=50(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 414
LDI r1, 173
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 453
LDI r6, 155
LDI r7, 496
LDI r8, 50
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
HALT
