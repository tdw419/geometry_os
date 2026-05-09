; DESCRIPTION: Composite: Places a blue circle of radius 40 at center (463, 94) then Places a magenta 53x45 rectangle at position (431, 143) then Renders a orange line between points (99, 201) and (74, 67).
; PLAN: r0=463(x), r1=94(y), r2=40(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=431(x), r6=143(y), r7=53(width), r8=45(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=99(x1), r11=201(y1), r12=74(x2), r13=67(y2), r14=0xFF8800(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 463
LDI r1, 94
LDI r2, 40
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 431
LDI r6, 143
LDI r7, 53
LDI r8, 45
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 99
LDI r11, 201
LDI r12, 74
LDI r13, 67
LDI r14, 0xFF8800
LINE r10, r11, r12, r13, r14
HALT
