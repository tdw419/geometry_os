; DESCRIPTION: Composite: Creates a magenta rectangular region at (465, 49) spanning 46 by 100 pixels then Draws a yellow line from (422, 218) to (121, 70) then Renders a purple disk with center (456, 203) and radius 26.
; PLAN: r0=465(x), r1=49(y), r2=46(width), r3=100(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=422(x1), r6=218(y1), r7=121(x2), r8=70(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=456(x), r11=203(y), r12=26(radius), r13=0xAA00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 465
LDI r1, 49
LDI r2, 46
LDI r3, 100
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 422
LDI r6, 218
LDI r7, 121
LDI r8, 70
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
LDI r10, 456
LDI r11, 203
LDI r12, 26
LDI r13, 0xAA00FF
CIRCLE r10, r11, r12, r13
HALT
