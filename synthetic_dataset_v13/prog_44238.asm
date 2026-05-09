; DESCRIPTION: Composite: Creates a green rectangular region at (343, 4) spanning 120 by 81 pixels then Places a orange dot at position (257, 10) then Places a red circle of radius 44 at center (147, 143).
; PLAN: r0=343(x), r1=4(y), r2=120(width), r3=81(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=257(x), r6=10(y), r7=0xFF8800(color). Op: PSET r5, r6, r7 Next: r10=147(x), r11=143(y), r12=44(radius), r13=0xFF0000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 343
LDI r1, 4
LDI r2, 120
LDI r3, 81
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 257
LDI r6, 10
LDI r7, 0xFF8800
PSET r5, r6, r7
LDI r10, 147
LDI r11, 143
LDI r12, 44
LDI r13, 0xFF0000
CIRCLE r10, r11, r12, r13
HALT
