; DESCRIPTION: Composite: Renders a orange box of size 44x32 starting at (35, 47) then Sets a single yellow pixel at (152, 235) then Creates a yellow circular shape at (155, 122) with radius 49.
; PLAN: r0=35(x), r1=47(y), r2=44(width), r3=32(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=152(x), r6=235(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7 Next: r10=155(x), r11=122(y), r12=49(radius), r13=0xFFFF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 35
LDI r1, 47
LDI r2, 44
LDI r3, 32
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 152
LDI r6, 235
LDI r7, 0xFFFF00
PSET r5, r6, r7
LDI r10, 155
LDI r11, 122
LDI r12, 49
LDI r13, 0xFFFF00
CIRCLE r10, r11, r12, r13
HALT
