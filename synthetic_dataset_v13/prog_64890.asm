; DESCRIPTION: Composite: Creates a orange rectangular region at (396, 155) spanning 46 by 92 pixels then Draws a black circle centered at (166, 54) with radius 52 then Sets a single red pixel at (171, 200).
; PLAN: r0=396(x), r1=155(y), r2=46(width), r3=92(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=166(x), r6=54(y), r7=52(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=171(x), r11=200(y), r12=0xFF0000(color). Op: PSET r10, r11, r12.
LDI r0, 396
LDI r1, 155
LDI r2, 46
LDI r3, 92
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 166
LDI r6, 54
LDI r7, 52
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
LDI r10, 171
LDI r11, 200
LDI r12, 0xFF0000
PSET r10, r11, r12
HALT
