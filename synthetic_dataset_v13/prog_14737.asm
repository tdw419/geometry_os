; DESCRIPTION: Composite: Draws a orange line from (60, 176) to (19, 103) then Sets a single white pixel at (296, 8) then Creates a black circular shape at (488, 162) with radius 14.
; PLAN: r0=60(x1), r1=176(y1), r2=19(x2), r3=103(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=296(x), r6=8(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7 Next: r10=488(x), r11=162(y), r12=14(radius), r13=0x000000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 60
LDI r1, 176
LDI r2, 19
LDI r3, 103
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 296
LDI r6, 8
LDI r7, 0xFFFFFF
PSET r5, r6, r7
LDI r10, 488
LDI r11, 162
LDI r12, 14
LDI r13, 0x000000
CIRCLE r10, r11, r12, r13
HALT
