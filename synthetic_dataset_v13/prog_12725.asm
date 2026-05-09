; DESCRIPTION: Composite: Renders a blue line between points (9, 34) and (196, 68) then Places a orange 51x54 rectangle at position (53, 198) then Creates a blue circular shape at (307, 174) with radius 51.
; PLAN: r0=9(x1), r1=34(y1), r2=196(x2), r3=68(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=53(x), r6=198(y), r7=51(width), r8=54(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=307(x), r11=174(y), r12=51(radius), r13=0x0000FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 9
LDI r1, 34
LDI r2, 196
LDI r3, 68
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 53
LDI r6, 198
LDI r7, 51
LDI r8, 54
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
LDI r10, 307
LDI r11, 174
LDI r12, 51
LDI r13, 0x0000FF
CIRCLE r10, r11, r12, r13
HALT
