; DESCRIPTION: Composite: Renders a orange box of size 79x69 starting at (343, 113) then Draws a yellow line from (454, 58) to (162, 244) then Places a purple circle of radius 54 at center (339, 182).
; PLAN: r0=343(x), r1=113(y), r2=79(width), r3=69(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=454(x1), r6=58(y1), r7=162(x2), r8=244(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=339(x), r11=182(y), r12=54(radius), r13=0xAA00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 343
LDI r1, 113
LDI r2, 79
LDI r3, 69
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 454
LDI r6, 58
LDI r7, 162
LDI r8, 244
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
LDI r10, 339
LDI r11, 182
LDI r12, 54
LDI r13, 0xAA00FF
CIRCLE r10, r11, r12, r13
HALT
