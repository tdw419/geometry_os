; DESCRIPTION: Composite: Draws a black line from (134, 142) to (489, 245) then Places a yellow 102x105 rectangle at position (177, 136) then Draws a white circle centered at (267, 142) with radius 39.
; PLAN: r0=134(x1), r1=142(y1), r2=489(x2), r3=245(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=177(x), r6=136(y), r7=102(width), r8=105(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=267(x), r11=142(y), r12=39(radius), r13=0xFFFFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 134
LDI r1, 142
LDI r2, 489
LDI r3, 245
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 177
LDI r6, 136
LDI r7, 102
LDI r8, 105
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
LDI r10, 267
LDI r11, 142
LDI r12, 39
LDI r13, 0xFFFFFF
CIRCLE r10, r11, r12, r13
HALT
