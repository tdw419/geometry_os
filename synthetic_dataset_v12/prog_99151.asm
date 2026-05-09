; DESCRIPTION: Composite: Draws a black rectangle at (52, 125) with width 21 and height 100 then Draws a magenta line from (466, 86) to (149, 209) then Renders a magenta disk with center (83, 112) and radius 75.
; PLAN: r0=52(x), r1=125(y), r2=21(width), r3=100(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=466(x1), r6=86(y1), r7=149(x2), r8=209(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=83(x), r11=112(y), r12=75(radius), r13=0xFF00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 52
LDI r1, 125
LDI r2, 21
LDI r3, 100
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 466
LDI r6, 86
LDI r7, 149
LDI r8, 209
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
LDI r10, 83
LDI r11, 112
LDI r12, 75
LDI r13, 0xFF00FF
CIRCLE r10, r11, r12, r13
HALT
