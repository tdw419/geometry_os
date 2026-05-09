; DESCRIPTION: Composite: Draws a yellow rectangle at (350, 15) with width 117 and height 108 then Renders a magenta line between points (282, 18) and (400, 178) then Sets a single magenta pixel at (84, 102).
; PLAN: r0=350(x), r1=15(y), r2=117(width), r3=108(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=282(x1), r6=18(y1), r7=400(x2), r8=178(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=84(x), r11=102(y), r12=0xFF00FF(color). Op: PSET r10, r11, r12.
LDI r0, 350
LDI r1, 15
LDI r2, 117
LDI r3, 108
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 282
LDI r6, 18
LDI r7, 400
LDI r8, 178
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
LDI r10, 84
LDI r11, 102
LDI r12, 0xFF00FF
PSET r10, r11, r12
HALT
