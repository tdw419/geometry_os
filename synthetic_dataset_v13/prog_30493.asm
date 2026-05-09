; DESCRIPTION: Composite: Draws a black line from (7, 209) to (367, 10) then Renders a yellow box of size 97x84 starting at (364, 121) then Creates a yellow circular shape at (200, 76) with radius 37.
; PLAN: r0=7(x1), r1=209(y1), r2=367(x2), r3=10(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=364(x), r6=121(y), r7=97(width), r8=84(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=200(x), r11=76(y), r12=37(radius), r13=0xFFFF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 7
LDI r1, 209
LDI r2, 367
LDI r3, 10
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 364
LDI r6, 121
LDI r7, 97
LDI r8, 84
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
LDI r10, 200
LDI r11, 76
LDI r12, 37
LDI r13, 0xFFFF00
CIRCLE r10, r11, r12, r13
HALT
