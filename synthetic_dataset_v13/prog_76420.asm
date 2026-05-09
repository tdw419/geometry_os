; DESCRIPTION: Composite: Creates a green rectangular region at (111, 175) spanning 25 by 63 pixels then Places a white dot at position (431, 244) then Creates a white circular shape at (261, 77) with radius 65.
; PLAN: r0=111(x), r1=175(y), r2=25(width), r3=63(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=431(x), r6=244(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7 Next: r10=261(x), r11=77(y), r12=65(radius), r13=0xFFFFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 111
LDI r1, 175
LDI r2, 25
LDI r3, 63
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 431
LDI r6, 244
LDI r7, 0xFFFFFF
PSET r5, r6, r7
LDI r10, 261
LDI r11, 77
LDI r12, 65
LDI r13, 0xFFFFFF
CIRCLE r10, r11, r12, r13
HALT
