; DESCRIPTION: Composite: Draws a black line from (10, 84) to (83, 31) then Renders a orange box of size 13x76 starting at (491, 110) then Places a black circle of radius 58 at center (422, 66).
; PLAN: r0=10(x1), r1=84(y1), r2=83(x2), r3=31(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=491(x), r6=110(y), r7=13(width), r8=76(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=422(x), r11=66(y), r12=58(radius), r13=0x000000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 10
LDI r1, 84
LDI r2, 83
LDI r3, 31
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 491
LDI r6, 110
LDI r7, 13
LDI r8, 76
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
LDI r10, 422
LDI r11, 66
LDI r12, 58
LDI r13, 0x000000
CIRCLE r10, r11, r12, r13
HALT
