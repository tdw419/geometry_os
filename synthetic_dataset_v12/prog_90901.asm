; DESCRIPTION: Composite: Places a magenta circle of radius 24 at center (192, 41) then Sets a single red pixel at (182, 13) then Draws a purple line from (261, 110) to (62, 29).
; PLAN: r0=192(x), r1=41(y), r2=24(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=182(x), r6=13(y), r7=0xFF0000(color). Op: PSET r5, r6, r7 Next: r10=261(x1), r11=110(y1), r12=62(x2), r13=29(y2), r14=0xAA00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 192
LDI r1, 41
LDI r2, 24
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 182
LDI r6, 13
LDI r7, 0xFF0000
PSET r5, r6, r7
LDI r10, 261
LDI r11, 110
LDI r12, 62
LDI r13, 29
LDI r14, 0xAA00FF
LINE r10, r11, r12, r13, r14
HALT
