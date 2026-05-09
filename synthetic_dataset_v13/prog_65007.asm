; DESCRIPTION: Composite: Places a purple line segment connecting (457, 102) to (242, 211) then Places a purple dot at position (441, 204).
; PLAN: r0=457(x1), r1=102(y1), r2=242(x2), r3=211(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=441(x), r6=204(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7.
LDI r0, 457
LDI r1, 102
LDI r2, 242
LDI r3, 211
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 441
LDI r6, 204
LDI r7, 0xAA00FF
PSET r5, r6, r7
HALT
