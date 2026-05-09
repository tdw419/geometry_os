; DESCRIPTION: Composite: Creates a green circular shape at (62, 90) with radius 13 then Sets a single yellow pixel at (307, 197) then Draws a purple line from (334, 15) to (368, 227).
; PLAN: r0=62(x), r1=90(y), r2=13(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=307(x), r6=197(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7 Next: r10=334(x1), r11=15(y1), r12=368(x2), r13=227(y2), r14=0xAA00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 62
LDI r1, 90
LDI r2, 13
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 307
LDI r6, 197
LDI r7, 0xFFFF00
PSET r5, r6, r7
LDI r10, 334
LDI r11, 15
LDI r12, 368
LDI r13, 227
LDI r14, 0xAA00FF
LINE r10, r11, r12, r13, r14
HALT
