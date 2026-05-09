; DESCRIPTION: Composite: Draws a purple line from (312, 2) to (59, 197) then Places a green dot at position (294, 137) then Creates a purple circular shape at (152, 167) with radius 72.
; PLAN: r0=312(x1), r1=2(y1), r2=59(x2), r3=197(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=294(x), r6=137(y), r7=0x00FF00(color). Op: PSET r5, r6, r7 Next: r10=152(x), r11=167(y), r12=72(radius), r13=0xAA00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 312
LDI r1, 2
LDI r2, 59
LDI r3, 197
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 294
LDI r6, 137
LDI r7, 0x00FF00
PSET r5, r6, r7
LDI r10, 152
LDI r11, 167
LDI r12, 72
LDI r13, 0xAA00FF
CIRCLE r10, r11, r12, r13
HALT
