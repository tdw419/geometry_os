; DESCRIPTION: Composite: Renders a green line between points (264, 142) and (11, 198) then Sets a single green pixel at (246, 238) then Draws a black rectangle at (309, 156) with width 86 and height 91.
; PLAN: r0=264(x1), r1=142(y1), r2=11(x2), r3=198(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=246(x), r6=238(y), r7=0x00FF00(color). Op: PSET r5, r6, r7 Next: r10=309(x), r11=156(y), r12=86(width), r13=91(height), r14=0x000000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 264
LDI r1, 142
LDI r2, 11
LDI r3, 198
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 246
LDI r6, 238
LDI r7, 0x00FF00
PSET r5, r6, r7
LDI r10, 309
LDI r11, 156
LDI r12, 86
LDI r13, 91
LDI r14, 0x000000
RECTF r10, r11, r12, r13, r14
HALT
