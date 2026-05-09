; DESCRIPTION: Composite: Creates a yellow rectangular region at (496, 150) spanning 15 by 64 pixels then Creates a black circular shape at (293, 77) with radius 67 then Places a purple dot at position (315, 220).
; PLAN: r0=496(x), r1=150(y), r2=15(width), r3=64(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=293(x), r6=77(y), r7=67(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=315(x), r11=220(y), r12=0xAA00FF(color). Op: PSET r10, r11, r12.
LDI r0, 496
LDI r1, 150
LDI r2, 15
LDI r3, 64
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 293
LDI r6, 77
LDI r7, 67
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
LDI r10, 315
LDI r11, 220
LDI r12, 0xAA00FF
PSET r10, r11, r12
HALT
