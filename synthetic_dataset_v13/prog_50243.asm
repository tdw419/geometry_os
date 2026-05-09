; DESCRIPTION: Composite: Draws a green circle centered at (188, 119) with radius 49 then Places a black dot at position (168, 99) then Places a black 63x83 rectangle at position (1, 69).
; PLAN: r0=188(x), r1=119(y), r2=49(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=168(x), r6=99(y), r7=0x000000(color). Op: PSET r5, r6, r7 Next: r10=1(x), r11=69(y), r12=63(width), r13=83(height), r14=0x000000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 188
LDI r1, 119
LDI r2, 49
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 168
LDI r6, 99
LDI r7, 0x000000
PSET r5, r6, r7
LDI r10, 1
LDI r11, 69
LDI r12, 63
LDI r13, 83
LDI r14, 0x000000
RECTF r10, r11, r12, r13, r14
HALT
