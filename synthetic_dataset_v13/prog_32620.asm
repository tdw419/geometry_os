; DESCRIPTION: Composite: Renders a yellow line between points (185, 180) and (5, 126) then Draws a orange rectangle at (108, 149) with width 80 and height 23 then Draws a magenta circle centered at (311, 82) with radius 55.
; PLAN: r0=185(x1), r1=180(y1), r2=5(x2), r3=126(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=108(x), r6=149(y), r7=80(width), r8=23(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=311(x), r11=82(y), r12=55(radius), r13=0xFF00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 185
LDI r1, 180
LDI r2, 5
LDI r3, 126
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 108
LDI r6, 149
LDI r7, 80
LDI r8, 23
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
LDI r10, 311
LDI r11, 82
LDI r12, 55
LDI r13, 0xFF00FF
CIRCLE r10, r11, r12, r13
HALT
