; DESCRIPTION: Composite: Sets a single black pixel at (484, 106) then Places a yellow line segment connecting (13, 21) to (133, 2).
; PLAN: r0=484(x), r1=106(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=13(x1), r6=21(y1), r7=133(x2), r8=2(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 484
LDI r1, 106
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 13
LDI r6, 21
LDI r7, 133
LDI r8, 2
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
HALT
