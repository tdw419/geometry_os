; DESCRIPTION: Composite: Places a black circle of radius 60 at center (318, 65) then Places a black dot at position (444, 57) then Draws a purple rectangle at (432, 83) with width 10 and height 53.
; PLAN: r0=318(x), r1=65(y), r2=60(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=444(x), r6=57(y), r7=0x000000(color). Op: PSET r5, r6, r7 Next: r10=432(x), r11=83(y), r12=10(width), r13=53(height), r14=0xAA00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 318
LDI r1, 65
LDI r2, 60
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 444
LDI r6, 57
LDI r7, 0x000000
PSET r5, r6, r7
LDI r10, 432
LDI r11, 83
LDI r12, 10
LDI r13, 53
LDI r14, 0xAA00FF
RECTF r10, r11, r12, r13, r14
HALT
