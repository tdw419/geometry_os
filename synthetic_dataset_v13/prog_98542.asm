; DESCRIPTION: Composite: Places a green dot at position (197, 187) then Renders a yellow line between points (57, 135) and (316, 162) then Draws a black circle centered at (207, 104) with radius 63.
; PLAN: r0=197(x), r1=187(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=57(x1), r6=135(y1), r7=316(x2), r8=162(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=207(x), r11=104(y), r12=63(radius), r13=0x000000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 197
LDI r1, 187
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 57
LDI r6, 135
LDI r7, 316
LDI r8, 162
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
LDI r10, 207
LDI r11, 104
LDI r12, 63
LDI r13, 0x000000
CIRCLE r10, r11, r12, r13
HALT
