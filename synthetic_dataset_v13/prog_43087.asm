; DESCRIPTION: Composite: Sets a single purple pixel at (438, 126) then Places a magenta line segment connecting (264, 224) to (325, 158).
; PLAN: r0=438(x), r1=126(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=264(x1), r6=224(y1), r7=325(x2), r8=158(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 438
LDI r1, 126
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 264
LDI r6, 224
LDI r7, 325
LDI r8, 158
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
HALT
