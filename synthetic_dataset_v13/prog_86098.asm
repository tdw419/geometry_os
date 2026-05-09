; DESCRIPTION: Composite: Draws a green rectangle at (234, 20) with width 52 and height 54 then Sets a single green pixel at (151, 91) then Draws a black line from (135, 2) to (496, 96).
; PLAN: r0=234(x), r1=20(y), r2=52(width), r3=54(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=151(x), r6=91(y), r7=0x00FF00(color). Op: PSET r5, r6, r7 Next: r10=135(x1), r11=2(y1), r12=496(x2), r13=96(y2), r14=0x000000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 234
LDI r1, 20
LDI r2, 52
LDI r3, 54
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 151
LDI r6, 91
LDI r7, 0x00FF00
PSET r5, r6, r7
LDI r10, 135
LDI r11, 2
LDI r12, 496
LDI r13, 96
LDI r14, 0x000000
LINE r10, r11, r12, r13, r14
HALT
