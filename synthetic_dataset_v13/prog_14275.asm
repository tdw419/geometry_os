; DESCRIPTION: Composite: Draws a purple line from (216, 229) to (356, 35) then Sets a single black pixel at (391, 170) then Draws a green rectangle at (218, 34) with width 81 and height 107.
; PLAN: r0=216(x1), r1=229(y1), r2=356(x2), r3=35(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=391(x), r6=170(y), r7=0x000000(color). Op: PSET r5, r6, r7 Next: r10=218(x), r11=34(y), r12=81(width), r13=107(height), r14=0x00FF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 216
LDI r1, 229
LDI r2, 356
LDI r3, 35
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 391
LDI r6, 170
LDI r7, 0x000000
PSET r5, r6, r7
LDI r10, 218
LDI r11, 34
LDI r12, 81
LDI r13, 107
LDI r14, 0x00FF00
RECTF r10, r11, r12, r13, r14
HALT
