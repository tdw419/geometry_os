; DESCRIPTION: Composite: Renders a blue box of size 73x49 starting at (250, 5) then Creates a green circular shape at (219, 191) with radius 11 then Places a yellow dot at position (436, 98).
; PLAN: r0=250(x), r1=5(y), r2=73(width), r3=49(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=219(x), r6=191(y), r7=11(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=436(x), r11=98(y), r12=0xFFFF00(color). Op: PSET r10, r11, r12.
LDI r0, 250
LDI r1, 5
LDI r2, 73
LDI r3, 49
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 219
LDI r6, 191
LDI r7, 11
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
LDI r10, 436
LDI r11, 98
LDI r12, 0xFFFF00
PSET r10, r11, r12
HALT
