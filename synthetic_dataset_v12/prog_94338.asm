; DESCRIPTION: Composite: Draws a black line from (214, 170) to (234, 245) then Renders a purple box of size 31x37 starting at (198, 83) then Draws a blue circle centered at (464, 175) with radius 10.
; PLAN: r0=214(x1), r1=170(y1), r2=234(x2), r3=245(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=198(x), r6=83(y), r7=31(width), r8=37(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=464(x), r11=175(y), r12=10(radius), r13=0x0000FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 214
LDI r1, 170
LDI r2, 234
LDI r3, 245
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 198
LDI r6, 83
LDI r7, 31
LDI r8, 37
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 464
LDI r11, 175
LDI r12, 10
LDI r13, 0x0000FF
CIRCLE r10, r11, r12, r13
HALT
