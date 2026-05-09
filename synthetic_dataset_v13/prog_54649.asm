; DESCRIPTION: Composite: Places a purple 107x104 rectangle at position (368, 19) then Draws a red line from (121, 217) to (337, 1) then Renders a black disk with center (362, 123) and radius 23.
; PLAN: r0=368(x), r1=19(y), r2=107(width), r3=104(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=121(x1), r6=217(y1), r7=337(x2), r8=1(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=362(x), r11=123(y), r12=23(radius), r13=0x000000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 368
LDI r1, 19
LDI r2, 107
LDI r3, 104
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 121
LDI r6, 217
LDI r7, 337
LDI r8, 1
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
LDI r10, 362
LDI r11, 123
LDI r12, 23
LDI r13, 0x000000
CIRCLE r10, r11, r12, r13
HALT
