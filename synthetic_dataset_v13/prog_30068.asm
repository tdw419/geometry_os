; DESCRIPTION: Composite: Draws a cyan rectangle at (17, 92) with width 35 and height 100 then Creates a purple circular shape at (487, 94) with radius 13 then Places a black dot at position (164, 24).
; PLAN: r0=17(x), r1=92(y), r2=35(width), r3=100(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=487(x), r6=94(y), r7=13(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=164(x), r11=24(y), r12=0x000000(color). Op: PSET r10, r11, r12.
LDI r0, 17
LDI r1, 92
LDI r2, 35
LDI r3, 100
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 487
LDI r6, 94
LDI r7, 13
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
LDI r10, 164
LDI r11, 24
LDI r12, 0x000000
PSET r10, r11, r12
HALT
