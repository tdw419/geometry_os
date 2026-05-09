; DESCRIPTION: Composite: Draws a yellow line from (421, 49) to (211, 10) then Draws a magenta rectangle at (171, 32) with width 71 and height 105 then Creates a blue circular shape at (315, 177) with radius 70.
; PLAN: r0=421(x1), r1=49(y1), r2=211(x2), r3=10(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=171(x), r6=32(y), r7=71(width), r8=105(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=315(x), r11=177(y), r12=70(radius), r13=0x0000FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 421
LDI r1, 49
LDI r2, 211
LDI r3, 10
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 171
LDI r6, 32
LDI r7, 71
LDI r8, 105
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 315
LDI r11, 177
LDI r12, 70
LDI r13, 0x0000FF
CIRCLE r10, r11, r12, r13
HALT
