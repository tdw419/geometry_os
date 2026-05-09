; DESCRIPTION: Composite: Places a black circle of radius 36 at center (424, 86) then Sets a single purple pixel at (164, 236) then Draws a magenta line from (45, 165) to (142, 114).
; PLAN: r0=424(x), r1=86(y), r2=36(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=164(x), r6=236(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7 Next: r10=45(x1), r11=165(y1), r12=142(x2), r13=114(y2), r14=0xFF00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 424
LDI r1, 86
LDI r2, 36
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 164
LDI r6, 236
LDI r7, 0xAA00FF
PSET r5, r6, r7
LDI r10, 45
LDI r11, 165
LDI r12, 142
LDI r13, 114
LDI r14, 0xFF00FF
LINE r10, r11, r12, r13, r14
HALT
