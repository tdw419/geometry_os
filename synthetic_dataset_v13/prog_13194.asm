; DESCRIPTION: Composite: Draws a purple rectangle at (87, 84) with width 34 and height 95 then Sets a single magenta pixel at (40, 197) then Draws a black circle centered at (388, 187) with radius 40.
; PLAN: r0=87(x), r1=84(y), r2=34(width), r3=95(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=40(x), r6=197(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7 Next: r10=388(x), r11=187(y), r12=40(radius), r13=0x000000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 87
LDI r1, 84
LDI r2, 34
LDI r3, 95
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 40
LDI r6, 197
LDI r7, 0xFF00FF
PSET r5, r6, r7
LDI r10, 388
LDI r11, 187
LDI r12, 40
LDI r13, 0x000000
CIRCLE r10, r11, r12, r13
HALT
