; DESCRIPTION: Composite: Draws a green circle centered at (279, 159) with radius 22 then Sets a single magenta pixel at (469, 71) then Draws a blue rectangle at (258, 119) with width 100 and height 41.
; PLAN: r0=279(x), r1=159(y), r2=22(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=469(x), r6=71(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7 Next: r10=258(x), r11=119(y), r12=100(width), r13=41(height), r14=0x0000FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 279
LDI r1, 159
LDI r2, 22
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 469
LDI r6, 71
LDI r7, 0xFF00FF
PSET r5, r6, r7
LDI r10, 258
LDI r11, 119
LDI r12, 100
LDI r13, 41
LDI r14, 0x0000FF
RECTF r10, r11, r12, r13, r14
HALT
