; DESCRIPTION: Composite: Draws a orange circle centered at (54, 49) with radius 45 then Creates a magenta rectangular region at (337, 11) spanning 60 by 36 pixels then Sets a single purple pixel at (308, 191).
; PLAN: r0=54(x), r1=49(y), r2=45(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=337(x), r6=11(y), r7=60(width), r8=36(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=308(x), r11=191(y), r12=0xAA00FF(color). Op: PSET r10, r11, r12.
LDI r0, 54
LDI r1, 49
LDI r2, 45
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 337
LDI r6, 11
LDI r7, 60
LDI r8, 36
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 308
LDI r11, 191
LDI r12, 0xAA00FF
PSET r10, r11, r12
HALT
