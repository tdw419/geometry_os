; DESCRIPTION: Composite: Places a green line segment connecting (313, 201) to (318, 218) then Places a yellow dot at position (185, 1) then Draws a cyan rectangle at (321, 59) with width 21 and height 107.
; PLAN: r0=313(x1), r1=201(y1), r2=318(x2), r3=218(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=185(x), r6=1(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7 Next: r10=321(x), r11=59(y), r12=21(width), r13=107(height), r14=0x00FFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 313
LDI r1, 201
LDI r2, 318
LDI r3, 218
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 185
LDI r6, 1
LDI r7, 0xFFFF00
PSET r5, r6, r7
LDI r10, 321
LDI r11, 59
LDI r12, 21
LDI r13, 107
LDI r14, 0x00FFFF
RECTF r10, r11, r12, r13, r14
HALT
