; DESCRIPTION: Composite: Draws a purple line from (507, 117) to (502, 212) then Draws a yellow circle centered at (390, 130) with radius 59 then Places a magenta 88x27 rectangle at position (359, 112).
; PLAN: r0=507(x1), r1=117(y1), r2=502(x2), r3=212(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=390(x), r6=130(y), r7=59(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=359(x), r11=112(y), r12=88(width), r13=27(height), r14=0xFF00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 507
LDI r1, 117
LDI r2, 502
LDI r3, 212
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 390
LDI r6, 130
LDI r7, 59
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
LDI r10, 359
LDI r11, 112
LDI r12, 88
LDI r13, 27
LDI r14, 0xFF00FF
RECTF r10, r11, r12, r13, r14
HALT
