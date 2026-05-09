; DESCRIPTION: Composite: Creates a blue circular shape at (141, 203) with radius 37 then Places a black dot at position (465, 76) then Draws a orange line from (4, 178) to (96, 140).
; PLAN: r0=141(x), r1=203(y), r2=37(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=465(x), r6=76(y), r7=0x000000(color). Op: PSET r5, r6, r7 Next: r10=4(x1), r11=178(y1), r12=96(x2), r13=140(y2), r14=0xFF8800(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 141
LDI r1, 203
LDI r2, 37
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 465
LDI r6, 76
LDI r7, 0x000000
PSET r5, r6, r7
LDI r10, 4
LDI r11, 178
LDI r12, 96
LDI r13, 140
LDI r14, 0xFF8800
LINE r10, r11, r12, r13, r14
HALT
