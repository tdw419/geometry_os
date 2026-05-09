; DESCRIPTION: Composite: Draws a white circle centered at (291, 113) with radius 57 then Renders a magenta line between points (334, 114) and (97, 106) then Draws a black rectangle at (386, 176) with width 33 and height 43.
; PLAN: r0=291(x), r1=113(y), r2=57(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=334(x1), r6=114(y1), r7=97(x2), r8=106(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=386(x), r11=176(y), r12=33(width), r13=43(height), r14=0x000000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 291
LDI r1, 113
LDI r2, 57
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 334
LDI r6, 114
LDI r7, 97
LDI r8, 106
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
LDI r10, 386
LDI r11, 176
LDI r12, 33
LDI r13, 43
LDI r14, 0x000000
RECTF r10, r11, r12, r13, r14
HALT
