; DESCRIPTION: Composite: Draws a green line from (101, 214) to (40, 91) then Draws a orange circle centered at (318, 125) with radius 64 then Places a purple 118x106 rectangle at position (269, 37).
; PLAN: r0=101(x1), r1=214(y1), r2=40(x2), r3=91(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=318(x), r6=125(y), r7=64(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=269(x), r11=37(y), r12=118(width), r13=106(height), r14=0xAA00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 101
LDI r1, 214
LDI r2, 40
LDI r3, 91
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 318
LDI r6, 125
LDI r7, 64
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
LDI r10, 269
LDI r11, 37
LDI r12, 118
LDI r13, 106
LDI r14, 0xAA00FF
RECTF r10, r11, r12, r13, r14
HALT
