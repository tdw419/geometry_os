; DESCRIPTION: Composite: Renders a white box of size 99x60 starting at (4, 162) then Places a black dot at position (195, 118) then Draws a purple circle centered at (443, 135) with radius 17.
; PLAN: r0=4(x), r1=162(y), r2=99(width), r3=60(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=195(x), r6=118(y), r7=0x000000(color). Op: PSET r5, r6, r7 Next: r10=443(x), r11=135(y), r12=17(radius), r13=0xAA00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 4
LDI r1, 162
LDI r2, 99
LDI r3, 60
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 195
LDI r6, 118
LDI r7, 0x000000
PSET r5, r6, r7
LDI r10, 443
LDI r11, 135
LDI r12, 17
LDI r13, 0xAA00FF
CIRCLE r10, r11, r12, r13
HALT
