; DESCRIPTION: Composite: Places a black line segment connecting (401, 123) to (223, 190) then Sets a single green pixel at (376, 84) then Draws a yellow rectangle at (278, 9) with width 15 and height 51.
; PLAN: r0=401(x1), r1=123(y1), r2=223(x2), r3=190(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=376(x), r6=84(y), r7=0x00FF00(color). Op: PSET r5, r6, r7 Next: r10=278(x), r11=9(y), r12=15(width), r13=51(height), r14=0xFFFF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 401
LDI r1, 123
LDI r2, 223
LDI r3, 190
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 376
LDI r6, 84
LDI r7, 0x00FF00
PSET r5, r6, r7
LDI r10, 278
LDI r11, 9
LDI r12, 15
LDI r13, 51
LDI r14, 0xFFFF00
RECTF r10, r11, r12, r13, r14
HALT
