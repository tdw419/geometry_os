; DESCRIPTION: Composite: Sets a single blue pixel at (458, 83) then Places a blue line segment connecting (29, 60) to (236, 37).
; PLAN: r0=458(x), r1=83(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=29(x1), r6=60(y1), r7=236(x2), r8=37(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 458
LDI r1, 83
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 29
LDI r6, 60
LDI r7, 236
LDI r8, 37
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
HALT
