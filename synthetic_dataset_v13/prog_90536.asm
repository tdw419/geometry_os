; DESCRIPTION: Composite: Places a green line segment connecting (190, 88) to (248, 167) then Places a white dot at position (445, 51) then Draws a yellow rectangle at (361, 148) with width 93 and height 29.
; PLAN: r0=190(x1), r1=88(y1), r2=248(x2), r3=167(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=445(x), r6=51(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7 Next: r10=361(x), r11=148(y), r12=93(width), r13=29(height), r14=0xFFFF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 190
LDI r1, 88
LDI r2, 248
LDI r3, 167
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 445
LDI r6, 51
LDI r7, 0xFFFFFF
PSET r5, r6, r7
LDI r10, 361
LDI r11, 148
LDI r12, 93
LDI r13, 29
LDI r14, 0xFFFF00
RECTF r10, r11, r12, r13, r14
HALT
