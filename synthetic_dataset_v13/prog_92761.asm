; DESCRIPTION: Composite: Sets a single yellow pixel at (256, 78) then Renders a purple line between points (501, 49) and (67, 175).
; PLAN: r0=256(x), r1=78(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=501(x1), r6=49(y1), r7=67(x2), r8=175(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 256
LDI r1, 78
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 501
LDI r6, 49
LDI r7, 67
LDI r8, 175
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
HALT
