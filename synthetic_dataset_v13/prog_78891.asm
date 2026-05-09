; DESCRIPTION: Composite: Draws a white circle centered at (411, 160) with radius 58 then Draws a magenta rectangle at (186, 158) with width 22 and height 29 then Places a purple dot at position (227, 250).
; PLAN: r0=411(x), r1=160(y), r2=58(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=186(x), r6=158(y), r7=22(width), r8=29(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=227(x), r11=250(y), r12=0xAA00FF(color). Op: PSET r10, r11, r12.
LDI r0, 411
LDI r1, 160
LDI r2, 58
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 186
LDI r6, 158
LDI r7, 22
LDI r8, 29
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 227
LDI r11, 250
LDI r12, 0xAA00FF
PSET r10, r11, r12
HALT
