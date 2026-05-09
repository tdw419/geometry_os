; DESCRIPTION: Composite: Places a magenta line segment connecting (131, 194) to (296, 24) then Draws a yellow rectangle at (63, 146) with width 116 and height 26 then Draws a green circle centered at (127, 182) with radius 74.
; PLAN: r0=131(x1), r1=194(y1), r2=296(x2), r3=24(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=63(x), r6=146(y), r7=116(width), r8=26(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=127(x), r11=182(y), r12=74(radius), r13=0x00FF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 131
LDI r1, 194
LDI r2, 296
LDI r3, 24
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 63
LDI r6, 146
LDI r7, 116
LDI r8, 26
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
LDI r10, 127
LDI r11, 182
LDI r12, 74
LDI r13, 0x00FF00
CIRCLE r10, r11, r12, r13
HALT
