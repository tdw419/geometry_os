; DESCRIPTION: Composite: Renders a green box of size 101x103 starting at (147, 9) then Places a black dot at position (457, 77) then Draws a black circle centered at (170, 118) with radius 73.
; PLAN: r0=147(x), r1=9(y), r2=101(width), r3=103(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=457(x), r6=77(y), r7=0x000000(color). Op: PSET r5, r6, r7 Next: r10=170(x), r11=118(y), r12=73(radius), r13=0x000000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 147
LDI r1, 9
LDI r2, 101
LDI r3, 103
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 457
LDI r6, 77
LDI r7, 0x000000
PSET r5, r6, r7
LDI r10, 170
LDI r11, 118
LDI r12, 73
LDI r13, 0x000000
CIRCLE r10, r11, r12, r13
HALT
