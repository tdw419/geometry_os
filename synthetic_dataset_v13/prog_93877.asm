; DESCRIPTION: Composite: Places a yellow line segment connecting (505, 65) to (38, 148) then Places a purple circle of radius 48 at center (247, 204) then Draws a cyan rectangle at (276, 91) with width 45 and height 51.
; PLAN: r0=505(x1), r1=65(y1), r2=38(x2), r3=148(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=247(x), r6=204(y), r7=48(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=276(x), r11=91(y), r12=45(width), r13=51(height), r14=0x00FFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 505
LDI r1, 65
LDI r2, 38
LDI r3, 148
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 247
LDI r6, 204
LDI r7, 48
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
LDI r10, 276
LDI r11, 91
LDI r12, 45
LDI r13, 51
LDI r14, 0x00FFFF
RECTF r10, r11, r12, r13, r14
HALT
