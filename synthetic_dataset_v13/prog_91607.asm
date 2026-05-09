; DESCRIPTION: Composite: Sets a single blue pixel at (13, 97) then Places a black line segment connecting (262, 46) to (510, 170).
; PLAN: r0=13(x), r1=97(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=262(x1), r6=46(y1), r7=510(x2), r8=170(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 13
LDI r1, 97
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 262
LDI r6, 46
LDI r7, 510
LDI r8, 170
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
HALT
