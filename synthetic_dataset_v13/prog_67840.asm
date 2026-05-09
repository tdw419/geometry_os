; DESCRIPTION: Composite: Creates a blue rectangular region at (361, 28) spanning 13 by 87 pixels then Places a black dot at position (95, 142) then Creates a black circular shape at (170, 188) with radius 40.
; PLAN: r0=361(x), r1=28(y), r2=13(width), r3=87(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=95(x), r6=142(y), r7=0x000000(color). Op: PSET r5, r6, r7 Next: r10=170(x), r11=188(y), r12=40(radius), r13=0x000000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 361
LDI r1, 28
LDI r2, 13
LDI r3, 87
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 95
LDI r6, 142
LDI r7, 0x000000
PSET r5, r6, r7
LDI r10, 170
LDI r11, 188
LDI r12, 40
LDI r13, 0x000000
CIRCLE r10, r11, r12, r13
HALT
