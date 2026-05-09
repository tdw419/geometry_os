; DESCRIPTION: Composite: Draws a magenta rectangle at (317, 81) with width 10 and height 74 then Places a orange line segment connecting (267, 45) to (255, 17) then Creates a black circular shape at (89, 80) with radius 47.
; PLAN: r0=317(x), r1=81(y), r2=10(width), r3=74(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=267(x1), r6=45(y1), r7=255(x2), r8=17(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=89(x), r11=80(y), r12=47(radius), r13=0x000000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 317
LDI r1, 81
LDI r2, 10
LDI r3, 74
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 267
LDI r6, 45
LDI r7, 255
LDI r8, 17
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
LDI r10, 89
LDI r11, 80
LDI r12, 47
LDI r13, 0x000000
CIRCLE r10, r11, r12, r13
HALT
