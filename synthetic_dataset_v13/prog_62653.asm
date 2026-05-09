; DESCRIPTION: Composite: Places a orange circle of radius 12 at center (264, 162) then Draws a green rectangle at (85, 134) with width 84 and height 98 then Places a blue line segment connecting (365, 135) to (465, 212).
; PLAN: r0=264(x), r1=162(y), r2=12(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=85(x), r6=134(y), r7=84(width), r8=98(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=365(x1), r11=135(y1), r12=465(x2), r13=212(y2), r14=0x0000FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 264
LDI r1, 162
LDI r2, 12
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 85
LDI r6, 134
LDI r7, 84
LDI r8, 98
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
LDI r10, 365
LDI r11, 135
LDI r12, 465
LDI r13, 212
LDI r14, 0x0000FF
LINE r10, r11, r12, r13, r14
HALT
