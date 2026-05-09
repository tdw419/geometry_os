; DESCRIPTION: Composite: Sets a single purple pixel at (195, 169) then Draws a yellow circle centered at (86, 148) with radius 21 then Creates a blue rectangular region at (199, 95) spanning 41 by 108 pixels.
; PLAN: r0=195(x), r1=169(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=86(x), r6=148(y), r7=21(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=199(x), r11=95(y), r12=41(width), r13=108(height), r14=0x0000FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 195
LDI r1, 169
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 86
LDI r6, 148
LDI r7, 21
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
LDI r10, 199
LDI r11, 95
LDI r12, 41
LDI r13, 108
LDI r14, 0x0000FF
RECTF r10, r11, r12, r13, r14
HALT
