; DESCRIPTION: Composite: Renders a white line between points (286, 102) and (322, 160) then Creates a yellow circular shape at (106, 106) with radius 37 then Draws a black rectangle at (40, 3) with width 68 and height 112.
; PLAN: r0=286(x1), r1=102(y1), r2=322(x2), r3=160(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=106(x), r6=106(y), r7=37(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=40(x), r11=3(y), r12=68(width), r13=112(height), r14=0x000000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 286
LDI r1, 102
LDI r2, 322
LDI r3, 160
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 106
LDI r6, 106
LDI r7, 37
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
LDI r10, 40
LDI r11, 3
LDI r12, 68
LDI r13, 112
LDI r14, 0x000000
RECTF r10, r11, r12, r13, r14
HALT
