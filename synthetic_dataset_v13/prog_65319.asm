; DESCRIPTION: Composite: Draws a purple circle centered at (131, 105) with radius 35 then Draws a magenta line from (38, 84) to (510, 120) then Renders a yellow box of size 71x20 starting at (13, 116).
; PLAN: r0=131(x), r1=105(y), r2=35(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=38(x1), r6=84(y1), r7=510(x2), r8=120(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=13(x), r11=116(y), r12=71(width), r13=20(height), r14=0xFFFF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 131
LDI r1, 105
LDI r2, 35
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 38
LDI r6, 84
LDI r7, 510
LDI r8, 120
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
LDI r10, 13
LDI r11, 116
LDI r12, 71
LDI r13, 20
LDI r14, 0xFFFF00
RECTF r10, r11, r12, r13, r14
HALT
