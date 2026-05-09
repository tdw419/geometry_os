; DESCRIPTION: Composite: Draws a red line from (63, 108) to (6, 143) then Draws a blue rectangle at (356, 121) with width 106 and height 12 then Draws a purple circle centered at (163, 179) with radius 63.
; PLAN: r0=63(x1), r1=108(y1), r2=6(x2), r3=143(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=356(x), r6=121(y), r7=106(width), r8=12(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=163(x), r11=179(y), r12=63(radius), r13=0xAA00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 63
LDI r1, 108
LDI r2, 6
LDI r3, 143
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 356
LDI r6, 121
LDI r7, 106
LDI r8, 12
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
LDI r10, 163
LDI r11, 179
LDI r12, 63
LDI r13, 0xAA00FF
CIRCLE r10, r11, r12, r13
HALT
