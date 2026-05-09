; DESCRIPTION: Composite: Sets a single green pixel at (227, 102) then Places a red line segment connecting (408, 22) to (141, 31).
; PLAN: r0=227(x), r1=102(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=408(x1), r6=22(y1), r7=141(x2), r8=31(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 227
LDI r1, 102
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 408
LDI r6, 22
LDI r7, 141
LDI r8, 31
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
HALT
