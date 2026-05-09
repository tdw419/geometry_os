; DESCRIPTION: Composite: Places a black line segment connecting (459, 212) to (425, 106) then Draws a purple rectangle at (55, 61) with width 82 and height 52 then Renders a yellow disk with center (130, 135) and radius 57.
; PLAN: r0=459(x1), r1=212(y1), r2=425(x2), r3=106(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=55(x), r6=61(y), r7=82(width), r8=52(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=130(x), r11=135(y), r12=57(radius), r13=0xFFFF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 459
LDI r1, 212
LDI r2, 425
LDI r3, 106
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 55
LDI r6, 61
LDI r7, 82
LDI r8, 52
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 130
LDI r11, 135
LDI r12, 57
LDI r13, 0xFFFF00
CIRCLE r10, r11, r12, r13
HALT
