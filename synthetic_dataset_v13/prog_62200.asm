; DESCRIPTION: Composite: Places a black line segment connecting (313, 56) to (395, 244) then Sets a single cyan pixel at (52, 225) then Draws a orange rectangle at (371, 36) with width 102 and height 26.
; PLAN: r0=313(x1), r1=56(y1), r2=395(x2), r3=244(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=52(x), r6=225(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7 Next: r10=371(x), r11=36(y), r12=102(width), r13=26(height), r14=0xFF8800(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 313
LDI r1, 56
LDI r2, 395
LDI r3, 244
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 52
LDI r6, 225
LDI r7, 0x00FFFF
PSET r5, r6, r7
LDI r10, 371
LDI r11, 36
LDI r12, 102
LDI r13, 26
LDI r14, 0xFF8800
RECTF r10, r11, r12, r13, r14
HALT
