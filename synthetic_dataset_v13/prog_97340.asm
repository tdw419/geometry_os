; DESCRIPTION: Composite: Places a red line segment connecting (153, 245) to (259, 30) then Renders a blue box of size 23x100 starting at (395, 81) then Draws a magenta circle centered at (157, 79) with radius 64.
; PLAN: r0=153(x1), r1=245(y1), r2=259(x2), r3=30(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=395(x), r6=81(y), r7=23(width), r8=100(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=157(x), r11=79(y), r12=64(radius), r13=0xFF00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 153
LDI r1, 245
LDI r2, 259
LDI r3, 30
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 395
LDI r6, 81
LDI r7, 23
LDI r8, 100
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
LDI r10, 157
LDI r11, 79
LDI r12, 64
LDI r13, 0xFF00FF
CIRCLE r10, r11, r12, r13
HALT
