; DESCRIPTION: Composite: Renders a yellow box of size 91x56 starting at (208, 69) then Draws a cyan line from (149, 23) to (468, 162) then Places a blue circle of radius 19 at center (313, 136).
; PLAN: r0=208(x), r1=69(y), r2=91(width), r3=56(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=149(x1), r6=23(y1), r7=468(x2), r8=162(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=313(x), r11=136(y), r12=19(radius), r13=0x0000FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 208
LDI r1, 69
LDI r2, 91
LDI r3, 56
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 149
LDI r6, 23
LDI r7, 468
LDI r8, 162
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
LDI r10, 313
LDI r11, 136
LDI r12, 19
LDI r13, 0x0000FF
CIRCLE r10, r11, r12, r13
HALT
