; DESCRIPTION: Composite: Draws a purple line from (104, 208) to (188, 212) then Sets a single blue pixel at (72, 100) then Draws a red rectangle at (71, 49) with width 53 and height 67.
; PLAN: r0=104(x1), r1=208(y1), r2=188(x2), r3=212(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=72(x), r6=100(y), r7=0x0000FF(color). Op: PSET r5, r6, r7 Next: r10=71(x), r11=49(y), r12=53(width), r13=67(height), r14=0xFF0000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 104
LDI r1, 208
LDI r2, 188
LDI r3, 212
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 72
LDI r6, 100
LDI r7, 0x0000FF
PSET r5, r6, r7
LDI r10, 71
LDI r11, 49
LDI r12, 53
LDI r13, 67
LDI r14, 0xFF0000
RECTF r10, r11, r12, r13, r14
HALT
