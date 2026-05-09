; DESCRIPTION: Composite: Draws a black line from (15, 57) to (161, 172) then Places a black 110x77 rectangle at position (161, 94) then Renders a yellow disk with center (244, 163) and radius 65.
; PLAN: r0=15(x1), r1=57(y1), r2=161(x2), r3=172(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=161(x), r6=94(y), r7=110(width), r8=77(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=244(x), r11=163(y), r12=65(radius), r13=0xFFFF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 15
LDI r1, 57
LDI r2, 161
LDI r3, 172
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 161
LDI r6, 94
LDI r7, 110
LDI r8, 77
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
LDI r10, 244
LDI r11, 163
LDI r12, 65
LDI r13, 0xFFFF00
CIRCLE r10, r11, r12, r13
HALT
