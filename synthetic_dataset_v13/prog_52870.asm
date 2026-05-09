; DESCRIPTION: Composite: Draws a yellow line from (146, 39) to (9, 113) then Creates a yellow rectangular region at (84, 200) spanning 98 by 32 pixels then Renders a purple disk with center (283, 203) and radius 38.
; PLAN: r0=146(x1), r1=39(y1), r2=9(x2), r3=113(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=84(x), r6=200(y), r7=98(width), r8=32(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=283(x), r11=203(y), r12=38(radius), r13=0xAA00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 146
LDI r1, 39
LDI r2, 9
LDI r3, 113
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 84
LDI r6, 200
LDI r7, 98
LDI r8, 32
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
LDI r10, 283
LDI r11, 203
LDI r12, 38
LDI r13, 0xAA00FF
CIRCLE r10, r11, r12, r13
HALT
