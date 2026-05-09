; DESCRIPTION: Composite: Sets a single purple pixel at (67, 84) then Renders a blue line between points (90, 110) and (236, 94).
; PLAN: r0=67(x), r1=84(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=90(x1), r6=110(y1), r7=236(x2), r8=94(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 67
LDI r1, 84
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 90
LDI r6, 110
LDI r7, 236
LDI r8, 94
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
HALT
