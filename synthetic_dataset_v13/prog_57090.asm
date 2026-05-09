; DESCRIPTION: Composite: Places a blue circle of radius 61 at center (444, 164) then Sets a single black pixel at (130, 208) then Draws a yellow line from (223, 64) to (384, 200).
; PLAN: r0=444(x), r1=164(y), r2=61(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=130(x), r6=208(y), r7=0x000000(color). Op: PSET r5, r6, r7 Next: r10=223(x1), r11=64(y1), r12=384(x2), r13=200(y2), r14=0xFFFF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 444
LDI r1, 164
LDI r2, 61
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 130
LDI r6, 208
LDI r7, 0x000000
PSET r5, r6, r7
LDI r10, 223
LDI r11, 64
LDI r12, 384
LDI r13, 200
LDI r14, 0xFFFF00
LINE r10, r11, r12, r13, r14
HALT
