; DESCRIPTION: Composite: Sets a single black pixel at (231, 207) then Places a red line segment connecting (158, 52) to (489, 148).
; PLAN: r0=231(x), r1=207(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=158(x1), r6=52(y1), r7=489(x2), r8=148(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 231
LDI r1, 207
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 158
LDI r6, 52
LDI r7, 489
LDI r8, 148
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
HALT
