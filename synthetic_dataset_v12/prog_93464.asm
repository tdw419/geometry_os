; DESCRIPTION: Composite: Creates a green rectangular region at (40, 62) spanning 25 by 109 pixels then Sets a single orange pixel at (114, 180) then Draws a cyan circle centered at (207, 140) with radius 55.
; PLAN: r0=40(x), r1=62(y), r2=25(width), r3=109(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=114(x), r6=180(y), r7=0xFF8800(color). Op: PSET r5, r6, r7 Next: r10=207(x), r11=140(y), r12=55(radius), r13=0x00FFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 40
LDI r1, 62
LDI r2, 25
LDI r3, 109
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 114
LDI r6, 180
LDI r7, 0xFF8800
PSET r5, r6, r7
LDI r10, 207
LDI r11, 140
LDI r12, 55
LDI r13, 0x00FFFF
CIRCLE r10, r11, r12, r13
HALT
