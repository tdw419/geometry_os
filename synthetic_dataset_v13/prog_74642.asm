; DESCRIPTION: Composite: Places a purple 46x36 rectangle at position (90, 11) then Places a black dot at position (172, 108) then Creates a magenta circular shape at (286, 110) with radius 57.
; PLAN: r0=90(x), r1=11(y), r2=46(width), r3=36(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=172(x), r6=108(y), r7=0x000000(color). Op: PSET r5, r6, r7 Next: r10=286(x), r11=110(y), r12=57(radius), r13=0xFF00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 90
LDI r1, 11
LDI r2, 46
LDI r3, 36
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 172
LDI r6, 108
LDI r7, 0x000000
PSET r5, r6, r7
LDI r10, 286
LDI r11, 110
LDI r12, 57
LDI r13, 0xFF00FF
CIRCLE r10, r11, r12, r13
HALT
