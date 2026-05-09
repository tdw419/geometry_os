; DESCRIPTION: Composite: Creates a white rectangular region at (257, 70) spanning 15 by 38 pixels then Places a yellow dot at position (0, 99) then Places a orange circle of radius 75 at center (100, 181).
; PLAN: r0=257(x), r1=70(y), r2=15(width), r3=38(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=0(x), r6=99(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7 Next: r10=100(x), r11=181(y), r12=75(radius), r13=0xFF8800(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 257
LDI r1, 70
LDI r2, 15
LDI r3, 38
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 0
LDI r6, 99
LDI r7, 0xFFFF00
PSET r5, r6, r7
LDI r10, 100
LDI r11, 181
LDI r12, 75
LDI r13, 0xFF8800
CIRCLE r10, r11, r12, r13
HALT
