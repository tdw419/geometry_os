; DESCRIPTION: Composite: Creates a blue rectangular region at (196, 159) spanning 38 by 38 pixels then Places a orange dot at position (112, 137) then Draws a purple circle centered at (190, 90) with radius 34.
; PLAN: r0=196(x), r1=159(y), r2=38(width), r3=38(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=112(x), r6=137(y), r7=0xFF8800(color). Op: PSET r5, r6, r7 Next: r10=190(x), r11=90(y), r12=34(radius), r13=0xAA00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 196
LDI r1, 159
LDI r2, 38
LDI r3, 38
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 112
LDI r6, 137
LDI r7, 0xFF8800
PSET r5, r6, r7
LDI r10, 190
LDI r11, 90
LDI r12, 34
LDI r13, 0xAA00FF
CIRCLE r10, r11, r12, r13
HALT
