; DESCRIPTION: Composite: Places a blue circle of radius 44 at center (408, 135) then Renders a red box of size 94x114 starting at (10, 44) then Draws a purple line from (389, 63) to (503, 35).
; PLAN: r0=408(x), r1=135(y), r2=44(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=10(x), r6=44(y), r7=94(width), r8=114(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=389(x1), r11=63(y1), r12=503(x2), r13=35(y2), r14=0xAA00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 408
LDI r1, 135
LDI r2, 44
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 10
LDI r6, 44
LDI r7, 94
LDI r8, 114
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
LDI r10, 389
LDI r11, 63
LDI r12, 503
LDI r13, 35
LDI r14, 0xAA00FF
LINE r10, r11, r12, r13, r14
HALT
