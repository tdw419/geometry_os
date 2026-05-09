; DESCRIPTION: Composite: Places a magenta line segment connecting (197, 172) to (454, 124) then Places a yellow 78x19 rectangle at position (87, 148) then Draws a orange circle centered at (86, 35) with radius 15.
; PLAN: r0=197(x1), r1=172(y1), r2=454(x2), r3=124(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=87(x), r6=148(y), r7=78(width), r8=19(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=86(x), r11=35(y), r12=15(radius), r13=0xFF8800(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 197
LDI r1, 172
LDI r2, 454
LDI r3, 124
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 87
LDI r6, 148
LDI r7, 78
LDI r8, 19
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
LDI r10, 86
LDI r11, 35
LDI r12, 15
LDI r13, 0xFF8800
CIRCLE r10, r11, r12, r13
HALT
