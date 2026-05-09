; DESCRIPTION: Composite: Draws a green rectangle at (32, 109) with width 36 and height 97 then Renders a magenta disk with center (405, 198) and radius 53 then Draws a magenta line from (125, 212) to (268, 110).
; PLAN: r0=32(x), r1=109(y), r2=36(width), r3=97(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=405(x), r6=198(y), r7=53(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=125(x1), r11=212(y1), r12=268(x2), r13=110(y2), r14=0xFF00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 32
LDI r1, 109
LDI r2, 36
LDI r3, 97
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 405
LDI r6, 198
LDI r7, 53
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
LDI r10, 125
LDI r11, 212
LDI r12, 268
LDI r13, 110
LDI r14, 0xFF00FF
LINE r10, r11, r12, r13, r14
HALT
