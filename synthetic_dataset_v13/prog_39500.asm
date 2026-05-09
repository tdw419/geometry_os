; DESCRIPTION: Composite: Draws a black rectangle at (311, 94) with width 53 and height 49 then Places a yellow dot at position (123, 145) then Places a red line segment connecting (76, 23) to (253, 255).
; PLAN: r0=311(x), r1=94(y), r2=53(width), r3=49(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=123(x), r6=145(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7 Next: r10=76(x1), r11=23(y1), r12=253(x2), r13=255(y2), r14=0xFF0000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 311
LDI r1, 94
LDI r2, 53
LDI r3, 49
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 123
LDI r6, 145
LDI r7, 0xFFFF00
PSET r5, r6, r7
LDI r10, 76
LDI r11, 23
LDI r12, 253
LDI r13, 255
LDI r14, 0xFF0000
LINE r10, r11, r12, r13, r14
HALT
