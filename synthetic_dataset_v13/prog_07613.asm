; DESCRIPTION: Composite: Places a white line segment connecting (277, 182) to (231, 207) then Sets a single blue pixel at (187, 197) then Creates a orange circular shape at (427, 68) with radius 28.
; PLAN: r0=277(x1), r1=182(y1), r2=231(x2), r3=207(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=187(x), r6=197(y), r7=0x0000FF(color). Op: PSET r5, r6, r7 Next: r10=427(x), r11=68(y), r12=28(radius), r13=0xFF8800(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 277
LDI r1, 182
LDI r2, 231
LDI r3, 207
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 187
LDI r6, 197
LDI r7, 0x0000FF
PSET r5, r6, r7
LDI r10, 427
LDI r11, 68
LDI r12, 28
LDI r13, 0xFF8800
CIRCLE r10, r11, r12, r13
HALT
