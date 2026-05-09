; DESCRIPTION: Composite: Places a magenta circle of radius 44 at center (44, 62) then Places a yellow dot at position (316, 101) then Draws a blue line from (233, 104) to (449, 72).
; PLAN: r0=44(x), r1=62(y), r2=44(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=316(x), r6=101(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7 Next: r10=233(x1), r11=104(y1), r12=449(x2), r13=72(y2), r14=0x0000FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 44
LDI r1, 62
LDI r2, 44
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 316
LDI r6, 101
LDI r7, 0xFFFF00
PSET r5, r6, r7
LDI r10, 233
LDI r11, 104
LDI r12, 449
LDI r13, 72
LDI r14, 0x0000FF
LINE r10, r11, r12, r13, r14
HALT
