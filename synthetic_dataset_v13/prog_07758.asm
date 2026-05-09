; DESCRIPTION: Composite: Places a black dot at position (283, 136) then Draws a orange line from (127, 188) to (89, 92) then Draws a blue rectangle at (57, 22) with width 25 and height 72.
; PLAN: r0=283(x), r1=136(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=127(x1), r6=188(y1), r7=89(x2), r8=92(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=57(x), r11=22(y), r12=25(width), r13=72(height), r14=0x0000FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 283
LDI r1, 136
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 127
LDI r6, 188
LDI r7, 89
LDI r8, 92
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
LDI r10, 57
LDI r11, 22
LDI r12, 25
LDI r13, 72
LDI r14, 0x0000FF
RECTF r10, r11, r12, r13, r14
HALT
