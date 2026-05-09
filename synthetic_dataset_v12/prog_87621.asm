; DESCRIPTION: Composite: Renders a yellow box of size 104x89 starting at (315, 20) then Places a magenta circle of radius 62 at center (174, 92) then Draws a orange line from (231, 25) to (181, 36).
; PLAN: r0=315(x), r1=20(y), r2=104(width), r3=89(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=174(x), r6=92(y), r7=62(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=231(x1), r11=25(y1), r12=181(x2), r13=36(y2), r14=0xFF8800(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 315
LDI r1, 20
LDI r2, 104
LDI r3, 89
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 174
LDI r6, 92
LDI r7, 62
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
LDI r10, 231
LDI r11, 25
LDI r12, 181
LDI r13, 36
LDI r14, 0xFF8800
LINE r10, r11, r12, r13, r14
HALT
