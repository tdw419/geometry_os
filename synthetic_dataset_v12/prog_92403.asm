; DESCRIPTION: Composite: Draws a magenta line from (402, 96) to (260, 161) then Draws a purple circle centered at (374, 123) with radius 34 then Places a purple 82x43 rectangle at position (10, 0).
; PLAN: r0=402(x1), r1=96(y1), r2=260(x2), r3=161(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=374(x), r6=123(y), r7=34(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=10(x), r11=0(y), r12=82(width), r13=43(height), r14=0xAA00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 402
LDI r1, 96
LDI r2, 260
LDI r3, 161
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 374
LDI r6, 123
LDI r7, 34
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
LDI r10, 10
LDI r11, 0
LDI r12, 82
LDI r13, 43
LDI r14, 0xAA00FF
RECTF r10, r11, r12, r13, r14
HALT
