; DESCRIPTION: Composite: Sets a single purple pixel at (36, 66) then Places a black line segment connecting (93, 21) to (341, 28).
; PLAN: r0=36(x), r1=66(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=93(x1), r6=21(y1), r7=341(x2), r8=28(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 36
LDI r1, 66
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 93
LDI r6, 21
LDI r7, 341
LDI r8, 28
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
HALT
