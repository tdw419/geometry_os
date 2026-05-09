; DESCRIPTION: Composite: Creates a purple rectangular region at (236, 77) spanning 88 by 43 pixels then Draws a white line from (128, 47) to (428, 123) then Places a purple circle of radius 55 at center (197, 156).
; PLAN: r0=236(x), r1=77(y), r2=88(width), r3=43(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=128(x1), r6=47(y1), r7=428(x2), r8=123(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=197(x), r11=156(y), r12=55(radius), r13=0xAA00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 236
LDI r1, 77
LDI r2, 88
LDI r3, 43
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 128
LDI r6, 47
LDI r7, 428
LDI r8, 123
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
LDI r10, 197
LDI r11, 156
LDI r12, 55
LDI r13, 0xAA00FF
CIRCLE r10, r11, r12, r13
HALT
