; DESCRIPTION: Composite: Places a purple dot at position (354, 11) then Renders a blue line between points (89, 72) and (302, 218) then Draws a green rectangle at (12, 88) with width 115 and height 45.
; PLAN: r0=354(x), r1=11(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=89(x1), r6=72(y1), r7=302(x2), r8=218(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=12(x), r11=88(y), r12=115(width), r13=45(height), r14=0x00FF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 354
LDI r1, 11
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 89
LDI r6, 72
LDI r7, 302
LDI r8, 218
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
LDI r10, 12
LDI r11, 88
LDI r12, 115
LDI r13, 45
LDI r14, 0x00FF00
RECTF r10, r11, r12, r13, r14
HALT
