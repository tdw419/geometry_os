; DESCRIPTION: Composite: Places a orange line segment connecting (45, 1) to (226, 176) then Places a purple dot at position (191, 104) then Renders a yellow box of size 114x84 starting at (91, 134).
; PLAN: r0=45(x1), r1=1(y1), r2=226(x2), r3=176(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=191(x), r6=104(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7 Next: r10=91(x), r11=134(y), r12=114(width), r13=84(height), r14=0xFFFF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 45
LDI r1, 1
LDI r2, 226
LDI r3, 176
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 191
LDI r6, 104
LDI r7, 0xAA00FF
PSET r5, r6, r7
LDI r10, 91
LDI r11, 134
LDI r12, 114
LDI r13, 84
LDI r14, 0xFFFF00
RECTF r10, r11, r12, r13, r14
HALT
