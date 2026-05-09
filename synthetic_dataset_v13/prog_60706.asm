; DESCRIPTION: Composite: Renders a white box of size 87x91 starting at (362, 60) then Creates a yellow circular shape at (55, 86) with radius 25 then Draws a green line from (17, 193) to (195, 212).
; PLAN: r0=362(x), r1=60(y), r2=87(width), r3=91(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=55(x), r6=86(y), r7=25(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=17(x1), r11=193(y1), r12=195(x2), r13=212(y2), r14=0x00FF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 362
LDI r1, 60
LDI r2, 87
LDI r3, 91
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 55
LDI r6, 86
LDI r7, 25
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
LDI r10, 17
LDI r11, 193
LDI r12, 195
LDI r13, 212
LDI r14, 0x00FF00
LINE r10, r11, r12, r13, r14
HALT
