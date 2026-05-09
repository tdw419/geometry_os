; DESCRIPTION: Composite: Sets a single purple pixel at (142, 190) then Draws a purple line from (49, 29) to (436, 97).
; PLAN: r0=142(x), r1=190(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=49(x1), r6=29(y1), r7=436(x2), r8=97(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 142
LDI r1, 190
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 49
LDI r6, 29
LDI r7, 436
LDI r8, 97
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
HALT
