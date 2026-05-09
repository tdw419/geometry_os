; DESCRIPTION: Composite: Creates a magenta rectangular region at (402, 9) spanning 101 by 14 pixels then Sets a single white pixel at (216, 46) then Draws a white circle centered at (58, 148) with radius 45.
; PLAN: r0=402(x), r1=9(y), r2=101(width), r3=14(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=216(x), r6=46(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7 Next: r10=58(x), r11=148(y), r12=45(radius), r13=0xFFFFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 402
LDI r1, 9
LDI r2, 101
LDI r3, 14
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 216
LDI r6, 46
LDI r7, 0xFFFFFF
PSET r5, r6, r7
LDI r10, 58
LDI r11, 148
LDI r12, 45
LDI r13, 0xFFFFFF
CIRCLE r10, r11, r12, r13
HALT
