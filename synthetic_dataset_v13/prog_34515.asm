; DESCRIPTION: Composite: Places a yellow line segment connecting (454, 229) to (394, 72) then Sets a single black pixel at (400, 170) then Renders a black box of size 89x49 starting at (72, 183).
; PLAN: r0=454(x1), r1=229(y1), r2=394(x2), r3=72(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=400(x), r6=170(y), r7=0x000000(color). Op: PSET r5, r6, r7 Next: r10=72(x), r11=183(y), r12=89(width), r13=49(height), r14=0x000000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 454
LDI r1, 229
LDI r2, 394
LDI r3, 72
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 400
LDI r6, 170
LDI r7, 0x000000
PSET r5, r6, r7
LDI r10, 72
LDI r11, 183
LDI r12, 89
LDI r13, 49
LDI r14, 0x000000
RECTF r10, r11, r12, r13, r14
HALT
