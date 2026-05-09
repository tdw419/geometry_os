; DESCRIPTION: Composite: Places a black dot at position (265, 46) then Creates a purple circular shape at (234, 63) with radius 45 then Places a black 92x109 rectangle at position (370, 65).
; PLAN: r0=265(x), r1=46(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=234(x), r6=63(y), r7=45(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=370(x), r11=65(y), r12=92(width), r13=109(height), r14=0x000000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 265
LDI r1, 46
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 234
LDI r6, 63
LDI r7, 45
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
LDI r10, 370
LDI r11, 65
LDI r12, 92
LDI r13, 109
LDI r14, 0x000000
RECTF r10, r11, r12, r13, r14
HALT
