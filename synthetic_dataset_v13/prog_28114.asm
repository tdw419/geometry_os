; DESCRIPTION: Composite: Places a white dot at position (264, 103) then Places a blue 118x101 rectangle at position (335, 91) then Draws a blue line from (273, 254) to (490, 158).
; PLAN: r0=264(x), r1=103(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=335(x), r6=91(y), r7=118(width), r8=101(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=273(x1), r11=254(y1), r12=490(x2), r13=158(y2), r14=0x0000FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 264
LDI r1, 103
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 335
LDI r6, 91
LDI r7, 118
LDI r8, 101
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
LDI r10, 273
LDI r11, 254
LDI r12, 490
LDI r13, 158
LDI r14, 0x0000FF
LINE r10, r11, r12, r13, r14
HALT
