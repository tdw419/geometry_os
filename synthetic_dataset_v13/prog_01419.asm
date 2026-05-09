; DESCRIPTION: Composite: Draws a purple line from (249, 83) to (503, 26) then Renders a yellow box of size 63x32 starting at (390, 167) then Draws a yellow circle centered at (404, 123) with radius 28.
; PLAN: r0=249(x1), r1=83(y1), r2=503(x2), r3=26(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=390(x), r6=167(y), r7=63(width), r8=32(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=404(x), r11=123(y), r12=28(radius), r13=0xFFFF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 249
LDI r1, 83
LDI r2, 503
LDI r3, 26
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 390
LDI r6, 167
LDI r7, 63
LDI r8, 32
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
LDI r10, 404
LDI r11, 123
LDI r12, 28
LDI r13, 0xFFFF00
CIRCLE r10, r11, r12, r13
HALT
