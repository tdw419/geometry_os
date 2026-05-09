; DESCRIPTION: Composite: Places a orange line segment connecting (140, 194) to (469, 17) then Draws a cyan rectangle at (303, 52) with width 20 and height 87 then Creates a black circular shape at (422, 73) with radius 47.
; PLAN: r0=140(x1), r1=194(y1), r2=469(x2), r3=17(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=303(x), r6=52(y), r7=20(width), r8=87(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=422(x), r11=73(y), r12=47(radius), r13=0x000000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 140
LDI r1, 194
LDI r2, 469
LDI r3, 17
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 303
LDI r6, 52
LDI r7, 20
LDI r8, 87
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 422
LDI r11, 73
LDI r12, 47
LDI r13, 0x000000
CIRCLE r10, r11, r12, r13
HALT
