; DESCRIPTION: Composite: Places a blue dot at position (190, 181) then Places a magenta line segment connecting (344, 227) to (442, 207) then Draws a magenta rectangle at (392, 112) with width 94 and height 51.
; PLAN: r0=190(x), r1=181(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=344(x1), r6=227(y1), r7=442(x2), r8=207(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=392(x), r11=112(y), r12=94(width), r13=51(height), r14=0xFF00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 190
LDI r1, 181
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 344
LDI r6, 227
LDI r7, 442
LDI r8, 207
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
LDI r10, 392
LDI r11, 112
LDI r12, 94
LDI r13, 51
LDI r14, 0xFF00FF
RECTF r10, r11, r12, r13, r14
HALT
