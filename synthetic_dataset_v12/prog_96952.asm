; DESCRIPTION: Composite: Renders a yellow line between points (76, 73) and (381, 95) then Sets a single black pixel at (258, 206) then Draws a yellow rectangle at (294, 156) with width 41 and height 60.
; PLAN: r0=76(x1), r1=73(y1), r2=381(x2), r3=95(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=258(x), r6=206(y), r7=0x000000(color). Op: PSET r5, r6, r7 Next: r10=294(x), r11=156(y), r12=41(width), r13=60(height), r14=0xFFFF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 76
LDI r1, 73
LDI r2, 381
LDI r3, 95
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 258
LDI r6, 206
LDI r7, 0x000000
PSET r5, r6, r7
LDI r10, 294
LDI r11, 156
LDI r12, 41
LDI r13, 60
LDI r14, 0xFFFF00
RECTF r10, r11, r12, r13, r14
HALT
