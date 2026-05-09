; DESCRIPTION: Composite: Sets a single purple pixel at (375, 217) then Places a blue line segment connecting (413, 250) to (471, 244).
; PLAN: r0=375(x), r1=217(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=413(x1), r6=250(y1), r7=471(x2), r8=244(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 375
LDI r1, 217
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 413
LDI r6, 250
LDI r7, 471
LDI r8, 244
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
HALT
