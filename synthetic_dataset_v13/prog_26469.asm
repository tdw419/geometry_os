; DESCRIPTION: Composite: Places a yellow line segment connecting (188, 2) to (187, 26) then Places a blue 87x110 rectangle at position (217, 28) then Draws a magenta circle centered at (153, 225) with radius 13.
; PLAN: r0=188(x1), r1=2(y1), r2=187(x2), r3=26(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=217(x), r6=28(y), r7=87(width), r8=110(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=153(x), r11=225(y), r12=13(radius), r13=0xFF00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 188
LDI r1, 2
LDI r2, 187
LDI r3, 26
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 217
LDI r6, 28
LDI r7, 87
LDI r8, 110
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
LDI r10, 153
LDI r11, 225
LDI r12, 13
LDI r13, 0xFF00FF
CIRCLE r10, r11, r12, r13
HALT
