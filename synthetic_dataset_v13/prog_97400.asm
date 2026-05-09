; DESCRIPTION: Composite: Draws a black rectangle at (67, 113) with width 99 and height 114 then Draws a blue line from (471, 1) to (343, 1) then Creates a green circular shape at (292, 29) with radius 24.
; PLAN: r0=67(x), r1=113(y), r2=99(width), r3=114(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=471(x1), r6=1(y1), r7=343(x2), r8=1(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=292(x), r11=29(y), r12=24(radius), r13=0x00FF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 67
LDI r1, 113
LDI r2, 99
LDI r3, 114
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 471
LDI r6, 1
LDI r7, 343
LDI r8, 1
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
LDI r10, 292
LDI r11, 29
LDI r12, 24
LDI r13, 0x00FF00
CIRCLE r10, r11, r12, r13
HALT
