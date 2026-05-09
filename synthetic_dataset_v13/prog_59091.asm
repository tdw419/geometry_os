; DESCRIPTION: Composite: Sets a single white pixel at (64, 252) then Places a purple line segment connecting (30, 4) to (195, 26).
; PLAN: r0=64(x), r1=252(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=30(x1), r6=4(y1), r7=195(x2), r8=26(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 64
LDI r1, 252
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 30
LDI r6, 4
LDI r7, 195
LDI r8, 26
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
HALT
