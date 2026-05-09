; DESCRIPTION: Composite: Sets a single white pixel at (402, 105) then Renders a purple line between points (74, 246) and (447, 4).
; PLAN: r0=402(x), r1=105(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=74(x1), r6=246(y1), r7=447(x2), r8=4(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 402
LDI r1, 105
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 74
LDI r6, 246
LDI r7, 447
LDI r8, 4
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
HALT
