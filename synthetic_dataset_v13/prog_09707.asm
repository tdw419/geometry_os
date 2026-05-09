; DESCRIPTION: Composite: Sets a single yellow pixel at (105, 157) then Places a purple line segment connecting (276, 91) to (214, 192).
; PLAN: r0=105(x), r1=157(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=276(x1), r6=91(y1), r7=214(x2), r8=192(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 105
LDI r1, 157
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 276
LDI r6, 91
LDI r7, 214
LDI r8, 192
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
HALT
