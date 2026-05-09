; DESCRIPTION: Composite: Creates a orange circular shape at (267, 93) with radius 19 then Draws a white rectangle at (33, 130) with width 43 and height 36 then Places a orange line segment connecting (118, 181) to (106, 26).
; PLAN: r0=267(x), r1=93(y), r2=19(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=33(x), r6=130(y), r7=43(width), r8=36(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=118(x1), r11=181(y1), r12=106(x2), r13=26(y2), r14=0xFF8800(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 267
LDI r1, 93
LDI r2, 19
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 33
LDI r6, 130
LDI r7, 43
LDI r8, 36
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 118
LDI r11, 181
LDI r12, 106
LDI r13, 26
LDI r14, 0xFF8800
LINE r10, r11, r12, r13, r14
HALT
