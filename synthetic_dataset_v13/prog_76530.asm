; DESCRIPTION: Composite: Places a purple line segment connecting (195, 249) to (297, 156) then Places a orange dot at position (114, 187).
; PLAN: r0=195(x1), r1=249(y1), r2=297(x2), r3=156(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=114(x), r6=187(y), r7=0xFF8800(color). Op: PSET r5, r6, r7.
LDI r0, 195
LDI r1, 249
LDI r2, 297
LDI r3, 156
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 114
LDI r6, 187
LDI r7, 0xFF8800
PSET r5, r6, r7
HALT
