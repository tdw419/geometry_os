; DESCRIPTION: Composite: Sets a single purple pixel at (226, 30) then Draws a black rectangle at (175, 134) with width 69 and height 76 then Creates a purple circular shape at (218, 54) with radius 37.
; PLAN: r0=226(x), r1=30(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=175(x), r6=134(y), r7=69(width), r8=76(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=218(x), r11=54(y), r12=37(radius), r13=0xAA00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 226
LDI r1, 30
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 175
LDI r6, 134
LDI r7, 69
LDI r8, 76
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
LDI r10, 218
LDI r11, 54
LDI r12, 37
LDI r13, 0xAA00FF
CIRCLE r10, r11, r12, r13
HALT
