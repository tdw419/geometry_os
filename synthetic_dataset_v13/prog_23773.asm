; DESCRIPTION: Composite: Places a purple circle of radius 69 at center (104, 107) then Sets a single green pixel at (310, 94) then Places a red line segment connecting (316, 23) to (387, 252).
; PLAN: r0=104(x), r1=107(y), r2=69(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=310(x), r6=94(y), r7=0x00FF00(color). Op: PSET r5, r6, r7 Next: r10=316(x1), r11=23(y1), r12=387(x2), r13=252(y2), r14=0xFF0000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 104
LDI r1, 107
LDI r2, 69
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 310
LDI r6, 94
LDI r7, 0x00FF00
PSET r5, r6, r7
LDI r10, 316
LDI r11, 23
LDI r12, 387
LDI r13, 252
LDI r14, 0xFF0000
LINE r10, r11, r12, r13, r14
HALT
