; DESCRIPTION: Composite: Places a blue line segment connecting (58, 244) to (33, 106) then Places a yellow dot at position (144, 198) then Draws a magenta rectangle at (238, 74) with width 113 and height 31.
; PLAN: r0=58(x1), r1=244(y1), r2=33(x2), r3=106(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=144(x), r6=198(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7 Next: r10=238(x), r11=74(y), r12=113(width), r13=31(height), r14=0xFF00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 58
LDI r1, 244
LDI r2, 33
LDI r3, 106
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 144
LDI r6, 198
LDI r7, 0xFFFF00
PSET r5, r6, r7
LDI r10, 238
LDI r11, 74
LDI r12, 113
LDI r13, 31
LDI r14, 0xFF00FF
RECTF r10, r11, r12, r13, r14
HALT
