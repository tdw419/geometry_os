; DESCRIPTION: Composite: Renders a blue line between points (235, 216) and (448, 7) then Sets a single purple pixel at (196, 119) then Draws a magenta rectangle at (205, 110) with width 104 and height 59.
; PLAN: r0=235(x1), r1=216(y1), r2=448(x2), r3=7(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=196(x), r6=119(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7 Next: r10=205(x), r11=110(y), r12=104(width), r13=59(height), r14=0xFF00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 235
LDI r1, 216
LDI r2, 448
LDI r3, 7
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 196
LDI r6, 119
LDI r7, 0xAA00FF
PSET r5, r6, r7
LDI r10, 205
LDI r11, 110
LDI r12, 104
LDI r13, 59
LDI r14, 0xFF00FF
RECTF r10, r11, r12, r13, r14
HALT
