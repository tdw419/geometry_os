; DESCRIPTION: Composite: Places a black line segment connecting (193, 124) to (0, 136) then Draws a magenta rectangle at (313, 40) with width 37 and height 110 then Creates a black circular shape at (307, 171) with radius 49.
; PLAN: r0=193(x1), r1=124(y1), r2=0(x2), r3=136(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=313(x), r6=40(y), r7=37(width), r8=110(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=307(x), r11=171(y), r12=49(radius), r13=0x000000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 193
LDI r1, 124
LDI r2, 0
LDI r3, 136
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 313
LDI r6, 40
LDI r7, 37
LDI r8, 110
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 307
LDI r11, 171
LDI r12, 49
LDI r13, 0x000000
CIRCLE r10, r11, r12, r13
HALT
