; DESCRIPTION: Composite: Draws a yellow rectangle at (34, 92) with width 53 and height 96 then Sets a single yellow pixel at (144, 66) then Places a red line segment connecting (464, 212) to (230, 222).
; PLAN: r0=34(x), r1=92(y), r2=53(width), r3=96(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=144(x), r6=66(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7 Next: r10=464(x1), r11=212(y1), r12=230(x2), r13=222(y2), r14=0xFF0000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 34
LDI r1, 92
LDI r2, 53
LDI r3, 96
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 144
LDI r6, 66
LDI r7, 0xFFFF00
PSET r5, r6, r7
LDI r10, 464
LDI r11, 212
LDI r12, 230
LDI r13, 222
LDI r14, 0xFF0000
LINE r10, r11, r12, r13, r14
HALT
