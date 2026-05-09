; DESCRIPTION: Composite: Places a red line segment connecting (492, 251) to (293, 84) then Renders a black box of size 114x112 starting at (101, 38) then Draws a yellow circle centered at (409, 166) with radius 27.
; PLAN: r0=492(x1), r1=251(y1), r2=293(x2), r3=84(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=101(x), r6=38(y), r7=114(width), r8=112(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=409(x), r11=166(y), r12=27(radius), r13=0xFFFF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 492
LDI r1, 251
LDI r2, 293
LDI r3, 84
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 101
LDI r6, 38
LDI r7, 114
LDI r8, 112
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
LDI r10, 409
LDI r11, 166
LDI r12, 27
LDI r13, 0xFFFF00
CIRCLE r10, r11, r12, r13
HALT
