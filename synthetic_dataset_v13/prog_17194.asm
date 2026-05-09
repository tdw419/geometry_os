; DESCRIPTION: Composite: Draws a green circle centered at (155, 69) with radius 45 then Places a green dot at position (97, 32) then Places a black 57x52 rectangle at position (351, 123).
; PLAN: r0=155(x), r1=69(y), r2=45(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=97(x), r6=32(y), r7=0x00FF00(color). Op: PSET r5, r6, r7 Next: r10=351(x), r11=123(y), r12=57(width), r13=52(height), r14=0x000000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 155
LDI r1, 69
LDI r2, 45
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 97
LDI r6, 32
LDI r7, 0x00FF00
PSET r5, r6, r7
LDI r10, 351
LDI r11, 123
LDI r12, 57
LDI r13, 52
LDI r14, 0x000000
RECTF r10, r11, r12, r13, r14
HALT
