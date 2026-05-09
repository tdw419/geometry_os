; DESCRIPTION: Composite: Draws a red line from (421, 178) to (7, 215) then Places a yellow circle of radius 35 at center (176, 176) then Creates a blue rectangular region at (162, 176) spanning 105 by 68 pixels.
; PLAN: r0=421(x1), r1=178(y1), r2=7(x2), r3=215(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=176(x), r6=176(y), r7=35(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=162(x), r11=176(y), r12=105(width), r13=68(height), r14=0x0000FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 421
LDI r1, 178
LDI r2, 7
LDI r3, 215
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 176
LDI r6, 176
LDI r7, 35
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
LDI r10, 162
LDI r11, 176
LDI r12, 105
LDI r13, 68
LDI r14, 0x0000FF
RECTF r10, r11, r12, r13, r14
HALT
