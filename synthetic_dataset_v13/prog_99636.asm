; DESCRIPTION: Composite: Sets a single white pixel at (86, 31) then Places a purple line segment connecting (105, 65) to (154, 35).
; PLAN: r0=86(x), r1=31(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=105(x1), r6=65(y1), r7=154(x2), r8=35(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 86
LDI r1, 31
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 105
LDI r6, 65
LDI r7, 154
LDI r8, 35
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
HALT
