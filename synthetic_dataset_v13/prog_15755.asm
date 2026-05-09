; DESCRIPTION: Composite: Places a purple dot at position (53, 227) then Places a red line segment connecting (278, 68) to (237, 199).
; PLAN: r0=53(x), r1=227(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=278(x1), r6=68(y1), r7=237(x2), r8=199(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 53
LDI r1, 227
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 278
LDI r6, 68
LDI r7, 237
LDI r8, 199
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
HALT
