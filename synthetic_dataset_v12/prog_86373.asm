; DESCRIPTION: Composite: Draws a yellow rectangle at (264, 53) with width 112 and height 66 then Places a purple dot at position (457, 128) then Creates a black circular shape at (156, 100) with radius 72.
; PLAN: r0=264(x), r1=53(y), r2=112(width), r3=66(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=457(x), r6=128(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7 Next: r10=156(x), r11=100(y), r12=72(radius), r13=0x000000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 264
LDI r1, 53
LDI r2, 112
LDI r3, 66
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 457
LDI r6, 128
LDI r7, 0xAA00FF
PSET r5, r6, r7
LDI r10, 156
LDI r11, 100
LDI r12, 72
LDI r13, 0x000000
CIRCLE r10, r11, r12, r13
HALT
