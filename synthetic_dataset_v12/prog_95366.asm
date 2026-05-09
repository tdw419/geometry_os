; DESCRIPTION: Composite: Renders a purple box of size 114x25 starting at (357, 227) then Draws a purple circle centered at (130, 198) with radius 36 then Places a cyan line segment connecting (251, 144) to (322, 214).
; PLAN: r0=357(x), r1=227(y), r2=114(width), r3=25(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=130(x), r6=198(y), r7=36(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=251(x1), r11=144(y1), r12=322(x2), r13=214(y2), r14=0x00FFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 357
LDI r1, 227
LDI r2, 114
LDI r3, 25
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 130
LDI r6, 198
LDI r7, 36
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
LDI r10, 251
LDI r11, 144
LDI r12, 322
LDI r13, 214
LDI r14, 0x00FFFF
LINE r10, r11, r12, r13, r14
HALT
