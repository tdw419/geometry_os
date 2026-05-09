; DESCRIPTION: Composite: Draws a yellow rectangle at (254, 163) with width 103 and height 87 then Sets a single yellow pixel at (77, 35) then Draws a yellow line from (363, 166) to (390, 138).
; PLAN: r0=254(x), r1=163(y), r2=103(width), r3=87(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=77(x), r6=35(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7 Next: r10=363(x1), r11=166(y1), r12=390(x2), r13=138(y2), r14=0xFFFF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 254
LDI r1, 163
LDI r2, 103
LDI r3, 87
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 77
LDI r6, 35
LDI r7, 0xFFFF00
PSET r5, r6, r7
LDI r10, 363
LDI r11, 166
LDI r12, 390
LDI r13, 138
LDI r14, 0xFFFF00
LINE r10, r11, r12, r13, r14
HALT
