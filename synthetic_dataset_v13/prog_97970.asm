; DESCRIPTION: Composite: Renders a blue box of size 23x34 starting at (432, 153) then Draws a cyan line from (201, 142) to (162, 59) then Places a red circle of radius 42 at center (133, 175).
; PLAN: r0=432(x), r1=153(y), r2=23(width), r3=34(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=201(x1), r6=142(y1), r7=162(x2), r8=59(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=133(x), r11=175(y), r12=42(radius), r13=0xFF0000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 432
LDI r1, 153
LDI r2, 23
LDI r3, 34
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 201
LDI r6, 142
LDI r7, 162
LDI r8, 59
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
LDI r10, 133
LDI r11, 175
LDI r12, 42
LDI r13, 0xFF0000
CIRCLE r10, r11, r12, r13
HALT
