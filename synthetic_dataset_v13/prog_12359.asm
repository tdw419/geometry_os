; DESCRIPTION: Composite: Draws a cyan rectangle at (273, 76) with width 84 and height 20 then Renders a cyan line between points (465, 136) and (306, 214) then Renders a orange disk with center (138, 127) and radius 75.
; PLAN: r0=273(x), r1=76(y), r2=84(width), r3=20(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=465(x1), r6=136(y1), r7=306(x2), r8=214(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=138(x), r11=127(y), r12=75(radius), r13=0xFF8800(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 273
LDI r1, 76
LDI r2, 84
LDI r3, 20
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 465
LDI r6, 136
LDI r7, 306
LDI r8, 214
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
LDI r10, 138
LDI r11, 127
LDI r12, 75
LDI r13, 0xFF8800
CIRCLE r10, r11, r12, r13
HALT
