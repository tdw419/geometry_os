; DESCRIPTION: Composite: Places a yellow 100x79 rectangle at position (156, 107) then Draws a purple line from (139, 211) to (83, 130).
; PLAN: r0=156(x), r1=107(y), r2=100(width), r3=79(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=139(x1), r6=211(y1), r7=83(x2), r8=130(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 156
LDI r1, 107
LDI r2, 100
LDI r3, 79
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 139
LDI r6, 211
LDI r7, 83
LDI r8, 130
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
HALT
