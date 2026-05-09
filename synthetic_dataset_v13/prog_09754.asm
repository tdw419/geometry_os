; DESCRIPTION: Composite: Draws a purple rectangle at (190, 61) with width 23 and height 91 then Sets a single yellow pixel at (67, 36) then Creates a green circular shape at (448, 85) with radius 58.
; PLAN: r0=190(x), r1=61(y), r2=23(width), r3=91(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=67(x), r6=36(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7 Next: r10=448(x), r11=85(y), r12=58(radius), r13=0x00FF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 190
LDI r1, 61
LDI r2, 23
LDI r3, 91
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 67
LDI r6, 36
LDI r7, 0xFFFF00
PSET r5, r6, r7
LDI r10, 448
LDI r11, 85
LDI r12, 58
LDI r13, 0x00FF00
CIRCLE r10, r11, r12, r13
HALT
