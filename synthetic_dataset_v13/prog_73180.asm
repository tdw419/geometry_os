; DESCRIPTION: Composite: Sets a single white pixel at (451, 121) then Creates a magenta rectangular region at (53, 13) spanning 40 by 89 pixels then Draws a purple circle centered at (356, 106) with radius 42.
; PLAN: r0=451(x), r1=121(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=53(x), r6=13(y), r7=40(width), r8=89(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=356(x), r11=106(y), r12=42(radius), r13=0xAA00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 451
LDI r1, 121
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 53
LDI r6, 13
LDI r7, 40
LDI r8, 89
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 356
LDI r11, 106
LDI r12, 42
LDI r13, 0xAA00FF
CIRCLE r10, r11, r12, r13
HALT
