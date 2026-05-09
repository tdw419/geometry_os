; DESCRIPTION: Composite: Places a cyan line segment connecting (312, 50) to (46, 68) then Sets a single blue pixel at (162, 114).
; PLAN: r0=312(x1), r1=50(y1), r2=46(x2), r3=68(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=162(x), r6=114(y), r7=0x0000FF(color). Op: PSET r5, r6, r7.
LDI r0, 312
LDI r1, 50
LDI r2, 46
LDI r3, 68
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 162
LDI r6, 114
LDI r7, 0x0000FF
PSET r5, r6, r7
HALT
