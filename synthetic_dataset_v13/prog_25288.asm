; DESCRIPTION: Composite: Places a red line segment connecting (111, 112) to (3, 97) then Sets a single red pixel at (332, 178) then Draws a yellow rectangle at (79, 18) with width 46 and height 32.
; PLAN: r0=111(x1), r1=112(y1), r2=3(x2), r3=97(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=332(x), r6=178(y), r7=0xFF0000(color). Op: PSET r5, r6, r7 Next: r10=79(x), r11=18(y), r12=46(width), r13=32(height), r14=0xFFFF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 111
LDI r1, 112
LDI r2, 3
LDI r3, 97
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 332
LDI r6, 178
LDI r7, 0xFF0000
PSET r5, r6, r7
LDI r10, 79
LDI r11, 18
LDI r12, 46
LDI r13, 32
LDI r14, 0xFFFF00
RECTF r10, r11, r12, r13, r14
HALT
