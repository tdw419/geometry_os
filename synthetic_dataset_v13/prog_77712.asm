; DESCRIPTION: Composite: Draws a green line from (188, 67) to (251, 148) then Places a yellow 43x104 rectangle at position (312, 65) then Places a purple circle of radius 28 at center (215, 193).
; PLAN: r0=188(x1), r1=67(y1), r2=251(x2), r3=148(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=312(x), r6=65(y), r7=43(width), r8=104(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=215(x), r11=193(y), r12=28(radius), r13=0xAA00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 188
LDI r1, 67
LDI r2, 251
LDI r3, 148
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 312
LDI r6, 65
LDI r7, 43
LDI r8, 104
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
LDI r10, 215
LDI r11, 193
LDI r12, 28
LDI r13, 0xAA00FF
CIRCLE r10, r11, r12, r13
HALT
