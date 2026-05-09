; DESCRIPTION: Composite: Draws a magenta rectangle at (64, 32) with width 14 and height 40 then Places a orange dot at position (462, 34) then Creates a purple circular shape at (454, 201) with radius 46.
; PLAN: r0=64(x), r1=32(y), r2=14(width), r3=40(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=462(x), r6=34(y), r7=0xFF8800(color). Op: PSET r5, r6, r7 Next: r10=454(x), r11=201(y), r12=46(radius), r13=0xAA00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 64
LDI r1, 32
LDI r2, 14
LDI r3, 40
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 462
LDI r6, 34
LDI r7, 0xFF8800
PSET r5, r6, r7
LDI r10, 454
LDI r11, 201
LDI r12, 46
LDI r13, 0xAA00FF
CIRCLE r10, r11, r12, r13
HALT
