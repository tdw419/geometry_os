; DESCRIPTION: Composite: Sets a single orange pixel at (505, 186) then Draws a purple rectangle at (26, 186) with width 46 and height 18 then Creates a blue circular shape at (395, 76) with radius 60.
; PLAN: r0=505(x), r1=186(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=26(x), r6=186(y), r7=46(width), r8=18(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=395(x), r11=76(y), r12=60(radius), r13=0x0000FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 505
LDI r1, 186
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 26
LDI r6, 186
LDI r7, 46
LDI r8, 18
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 395
LDI r11, 76
LDI r12, 60
LDI r13, 0x0000FF
CIRCLE r10, r11, r12, r13
HALT
