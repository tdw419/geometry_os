; DESCRIPTION: Composite: Renders a green box of size 89x70 starting at (173, 55) then Places a yellow dot at position (11, 218) then Creates a black circular shape at (359, 183) with radius 60.
; PLAN: r0=173(x), r1=55(y), r2=89(width), r3=70(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=11(x), r6=218(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7 Next: r10=359(x), r11=183(y), r12=60(radius), r13=0x000000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 173
LDI r1, 55
LDI r2, 89
LDI r3, 70
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 11
LDI r6, 218
LDI r7, 0xFFFF00
PSET r5, r6, r7
LDI r10, 359
LDI r11, 183
LDI r12, 60
LDI r13, 0x000000
CIRCLE r10, r11, r12, r13
HALT
