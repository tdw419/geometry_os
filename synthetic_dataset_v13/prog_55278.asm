; DESCRIPTION: Composite: Draws a black line from (379, 9) to (91, 227) then Sets a single green pixel at (468, 230) then Draws a orange rectangle at (442, 157) with width 59 and height 19.
; PLAN: r0=379(x1), r1=9(y1), r2=91(x2), r3=227(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=468(x), r6=230(y), r7=0x00FF00(color). Op: PSET r5, r6, r7 Next: r10=442(x), r11=157(y), r12=59(width), r13=19(height), r14=0xFF8800(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 379
LDI r1, 9
LDI r2, 91
LDI r3, 227
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 468
LDI r6, 230
LDI r7, 0x00FF00
PSET r5, r6, r7
LDI r10, 442
LDI r11, 157
LDI r12, 59
LDI r13, 19
LDI r14, 0xFF8800
RECTF r10, r11, r12, r13, r14
HALT
