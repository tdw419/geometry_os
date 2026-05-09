; DESCRIPTION: Composite: Creates a black circular shape at (310, 134) with radius 66 then Renders a purple line between points (14, 68) and (345, 181) then Draws a cyan rectangle at (329, 51) with width 58 and height 38.
; PLAN: r0=310(x), r1=134(y), r2=66(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=14(x1), r6=68(y1), r7=345(x2), r8=181(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=329(x), r11=51(y), r12=58(width), r13=38(height), r14=0x00FFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 310
LDI r1, 134
LDI r2, 66
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 14
LDI r6, 68
LDI r7, 345
LDI r8, 181
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
LDI r10, 329
LDI r11, 51
LDI r12, 58
LDI r13, 38
LDI r14, 0x00FFFF
RECTF r10, r11, r12, r13, r14
HALT
