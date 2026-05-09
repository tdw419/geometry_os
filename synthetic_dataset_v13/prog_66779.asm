; DESCRIPTION: Composite: Renders a orange line between points (248, 68) and (103, 208) then Sets a single black pixel at (2, 151).
; PLAN: r0=248(x1), r1=68(y1), r2=103(x2), r3=208(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=2(x), r6=151(y), r7=0x000000(color). Op: PSET r5, r6, r7.
LDI r0, 248
LDI r1, 68
LDI r2, 103
LDI r3, 208
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 2
LDI r6, 151
LDI r7, 0x000000
PSET r5, r6, r7
HALT
