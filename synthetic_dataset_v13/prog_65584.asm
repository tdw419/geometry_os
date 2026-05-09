; DESCRIPTION: Composite: Places a yellow line segment connecting (300, 79) to (251, 80) then Renders a white box of size 60x44 starting at (222, 179) then Draws a magenta circle centered at (285, 60) with radius 35.
; PLAN: r0=300(x1), r1=79(y1), r2=251(x2), r3=80(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=222(x), r6=179(y), r7=60(width), r8=44(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=285(x), r11=60(y), r12=35(radius), r13=0xFF00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 300
LDI r1, 79
LDI r2, 251
LDI r3, 80
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 222
LDI r6, 179
LDI r7, 60
LDI r8, 44
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 285
LDI r11, 60
LDI r12, 35
LDI r13, 0xFF00FF
CIRCLE r10, r11, r12, r13
HALT
