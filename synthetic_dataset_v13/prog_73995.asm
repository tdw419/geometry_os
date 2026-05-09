; DESCRIPTION: Composite: Places a red dot at position (191, 11) then Places a purple line segment connecting (441, 154) to (98, 123).
; PLAN: r0=191(x), r1=11(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=441(x1), r6=154(y1), r7=98(x2), r8=123(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 191
LDI r1, 11
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 441
LDI r6, 154
LDI r7, 98
LDI r8, 123
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
HALT
