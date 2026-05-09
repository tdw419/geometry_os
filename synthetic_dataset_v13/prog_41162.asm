; DESCRIPTION: Composite: Creates a purple rectangular region at (158, 177) spanning 76 by 74 pixels then Draws a orange circle centered at (225, 148) with radius 73 then Places a black dot at position (235, 200).
; PLAN: r0=158(x), r1=177(y), r2=76(width), r3=74(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=225(x), r6=148(y), r7=73(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=235(x), r11=200(y), r12=0x000000(color). Op: PSET r10, r11, r12.
LDI r0, 158
LDI r1, 177
LDI r2, 76
LDI r3, 74
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 225
LDI r6, 148
LDI r7, 73
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
LDI r10, 235
LDI r11, 200
LDI r12, 0x000000
PSET r10, r11, r12
HALT
