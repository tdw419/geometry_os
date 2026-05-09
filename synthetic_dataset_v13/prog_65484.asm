; DESCRIPTION: Composite: Places a blue 116x78 rectangle at position (301, 28) then Draws a blue line from (51, 143) to (261, 22) then Draws a black circle centered at (319, 113) with radius 16.
; PLAN: r0=301(x), r1=28(y), r2=116(width), r3=78(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=51(x1), r6=143(y1), r7=261(x2), r8=22(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=319(x), r11=113(y), r12=16(radius), r13=0x000000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 301
LDI r1, 28
LDI r2, 116
LDI r3, 78
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 51
LDI r6, 143
LDI r7, 261
LDI r8, 22
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
LDI r10, 319
LDI r11, 113
LDI r12, 16
LDI r13, 0x000000
CIRCLE r10, r11, r12, r13
HALT
