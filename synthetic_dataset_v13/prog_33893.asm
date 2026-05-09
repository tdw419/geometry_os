; DESCRIPTION: Composite: Draws a yellow rectangle at (261, 133) with width 47 and height 61 then Renders a green line between points (7, 84) and (150, 185) then Places a orange circle of radius 79 at center (205, 94).
; PLAN: r0=261(x), r1=133(y), r2=47(width), r3=61(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=7(x1), r6=84(y1), r7=150(x2), r8=185(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=205(x), r11=94(y), r12=79(radius), r13=0xFF8800(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 261
LDI r1, 133
LDI r2, 47
LDI r3, 61
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 7
LDI r6, 84
LDI r7, 150
LDI r8, 185
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
LDI r10, 205
LDI r11, 94
LDI r12, 79
LDI r13, 0xFF8800
CIRCLE r10, r11, r12, r13
HALT
