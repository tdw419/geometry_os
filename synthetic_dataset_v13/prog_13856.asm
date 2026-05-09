; DESCRIPTION: Composite: Creates a purple circular shape at (366, 192) with radius 46 then Places a red line segment connecting (391, 114) to (170, 254) then Renders a yellow box of size 58x11 starting at (174, 88).
; PLAN: r0=366(x), r1=192(y), r2=46(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=391(x1), r6=114(y1), r7=170(x2), r8=254(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=174(x), r11=88(y), r12=58(width), r13=11(height), r14=0xFFFF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 366
LDI r1, 192
LDI r2, 46
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 391
LDI r6, 114
LDI r7, 170
LDI r8, 254
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
LDI r10, 174
LDI r11, 88
LDI r12, 58
LDI r13, 11
LDI r14, 0xFFFF00
RECTF r10, r11, r12, r13, r14
HALT
