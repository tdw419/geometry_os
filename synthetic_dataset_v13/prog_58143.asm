; DESCRIPTION: Composite: Draws a orange line from (67, 163) to (238, 172) then Draws a orange rectangle at (264, 137) with width 25 and height 109 then Creates a yellow circular shape at (279, 87) with radius 44.
; PLAN: r0=67(x1), r1=163(y1), r2=238(x2), r3=172(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=264(x), r6=137(y), r7=25(width), r8=109(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=279(x), r11=87(y), r12=44(radius), r13=0xFFFF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 67
LDI r1, 163
LDI r2, 238
LDI r3, 172
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 264
LDI r6, 137
LDI r7, 25
LDI r8, 109
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
LDI r10, 279
LDI r11, 87
LDI r12, 44
LDI r13, 0xFFFF00
CIRCLE r10, r11, r12, r13
HALT
