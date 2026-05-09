; DESCRIPTION: Composite: Renders a yellow line between points (93, 249) and (310, 244) then Creates a yellow circular shape at (111, 191) with radius 56 then Draws a orange rectangle at (44, 6) with width 107 and height 105.
; PLAN: r0=93(x1), r1=249(y1), r2=310(x2), r3=244(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=111(x), r6=191(y), r7=56(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=44(x), r11=6(y), r12=107(width), r13=105(height), r14=0xFF8800(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 93
LDI r1, 249
LDI r2, 310
LDI r3, 244
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 111
LDI r6, 191
LDI r7, 56
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
LDI r10, 44
LDI r11, 6
LDI r12, 107
LDI r13, 105
LDI r14, 0xFF8800
RECTF r10, r11, r12, r13, r14
HALT
