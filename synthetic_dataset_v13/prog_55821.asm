; DESCRIPTION: Composite: Draws a purple line from (297, 86) to (45, 201) then Draws a black circle centered at (245, 219) with radius 13 then Places a black 29x51 rectangle at position (230, 195).
; PLAN: r0=297(x1), r1=86(y1), r2=45(x2), r3=201(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=245(x), r6=219(y), r7=13(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=230(x), r11=195(y), r12=29(width), r13=51(height), r14=0x000000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 297
LDI r1, 86
LDI r2, 45
LDI r3, 201
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 245
LDI r6, 219
LDI r7, 13
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
LDI r10, 230
LDI r11, 195
LDI r12, 29
LDI r13, 51
LDI r14, 0x000000
RECTF r10, r11, r12, r13, r14
HALT
