; DESCRIPTION: Composite: Draws a purple line from (109, 19) to (164, 4) then Creates a magenta circular shape at (418, 114) with radius 25 then Renders a black box of size 83x18 starting at (195, 12).
; PLAN: r0=109(x1), r1=19(y1), r2=164(x2), r3=4(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=418(x), r6=114(y), r7=25(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=195(x), r11=12(y), r12=83(width), r13=18(height), r14=0x000000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 109
LDI r1, 19
LDI r2, 164
LDI r3, 4
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 418
LDI r6, 114
LDI r7, 25
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
LDI r10, 195
LDI r11, 12
LDI r12, 83
LDI r13, 18
LDI r14, 0x000000
RECTF r10, r11, r12, r13, r14
HALT
