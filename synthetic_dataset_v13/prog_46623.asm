; DESCRIPTION: Composite: Places a green dot at position (51, 198) then Draws a black rectangle at (4, 53) with width 10 and height 58 then Creates a blue circular shape at (72, 96) with radius 63.
; PLAN: r0=51(x), r1=198(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=4(x), r6=53(y), r7=10(width), r8=58(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=72(x), r11=96(y), r12=63(radius), r13=0x0000FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 51
LDI r1, 198
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 4
LDI r6, 53
LDI r7, 10
LDI r8, 58
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
LDI r10, 72
LDI r11, 96
LDI r12, 63
LDI r13, 0x0000FF
CIRCLE r10, r11, r12, r13
HALT
