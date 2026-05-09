; DESCRIPTION: Composite: Creates a white rectangular region at (378, 44) spanning 97 by 93 pixels then Sets a single red pixel at (97, 200) then Draws a white circle centered at (58, 79) with radius 35.
; PLAN: r0=378(x), r1=44(y), r2=97(width), r3=93(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=97(x), r6=200(y), r7=0xFF0000(color). Op: PSET r5, r6, r7 Next: r10=58(x), r11=79(y), r12=35(radius), r13=0xFFFFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 378
LDI r1, 44
LDI r2, 97
LDI r3, 93
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 97
LDI r6, 200
LDI r7, 0xFF0000
PSET r5, r6, r7
LDI r10, 58
LDI r11, 79
LDI r12, 35
LDI r13, 0xFFFFFF
CIRCLE r10, r11, r12, r13
HALT
