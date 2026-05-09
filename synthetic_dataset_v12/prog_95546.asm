; DESCRIPTION: Composite: Renders a blue box of size 13x65 starting at (311, 104) then Draws a red circle centered at (329, 114) with radius 75 then Draws a white line from (241, 136) to (263, 9).
; PLAN: r0=311(x), r1=104(y), r2=13(width), r3=65(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=329(x), r6=114(y), r7=75(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=241(x1), r11=136(y1), r12=263(x2), r13=9(y2), r14=0xFFFFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 311
LDI r1, 104
LDI r2, 13
LDI r3, 65
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 329
LDI r6, 114
LDI r7, 75
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
LDI r10, 241
LDI r11, 136
LDI r12, 263
LDI r13, 9
LDI r14, 0xFFFFFF
LINE r10, r11, r12, r13, r14
HALT
