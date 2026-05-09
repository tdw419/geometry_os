; DESCRIPTION: Composite: Places a cyan line segment connecting (227, 178) to (264, 145) then Places a black dot at position (40, 246) then Draws a magenta rectangle at (91, 59) with width 30 and height 60.
; PLAN: r0=227(x1), r1=178(y1), r2=264(x2), r3=145(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=40(x), r6=246(y), r7=0x000000(color). Op: PSET r5, r6, r7 Next: r10=91(x), r11=59(y), r12=30(width), r13=60(height), r14=0xFF00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 227
LDI r1, 178
LDI r2, 264
LDI r3, 145
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 40
LDI r6, 246
LDI r7, 0x000000
PSET r5, r6, r7
LDI r10, 91
LDI r11, 59
LDI r12, 30
LDI r13, 60
LDI r14, 0xFF00FF
RECTF r10, r11, r12, r13, r14
HALT
