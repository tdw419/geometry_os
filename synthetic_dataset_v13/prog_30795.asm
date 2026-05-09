; DESCRIPTION: Composite: Draws a red line from (203, 189) to (80, 175) then Renders a magenta box of size 51x66 starting at (158, 94) then Draws a red circle centered at (80, 131) with radius 63.
; PLAN: r0=203(x1), r1=189(y1), r2=80(x2), r3=175(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=158(x), r6=94(y), r7=51(width), r8=66(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=80(x), r11=131(y), r12=63(radius), r13=0xFF0000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 203
LDI r1, 189
LDI r2, 80
LDI r3, 175
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 158
LDI r6, 94
LDI r7, 51
LDI r8, 66
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 80
LDI r11, 131
LDI r12, 63
LDI r13, 0xFF0000
CIRCLE r10, r11, r12, r13
HALT
