; DESCRIPTION: Composite: Draws a orange line from (368, 207) to (391, 158) then Sets a single magenta pixel at (275, 99) then Draws a white rectangle at (405, 55) with width 78 and height 98.
; PLAN: r0=368(x1), r1=207(y1), r2=391(x2), r3=158(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=275(x), r6=99(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7 Next: r10=405(x), r11=55(y), r12=78(width), r13=98(height), r14=0xFFFFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 368
LDI r1, 207
LDI r2, 391
LDI r3, 158
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 275
LDI r6, 99
LDI r7, 0xFF00FF
PSET r5, r6, r7
LDI r10, 405
LDI r11, 55
LDI r12, 78
LDI r13, 98
LDI r14, 0xFFFFFF
RECTF r10, r11, r12, r13, r14
HALT
