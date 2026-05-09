; DESCRIPTION: Composite: Draws a green rectangle at (278, 52) with width 118 and height 106 then Sets a single orange pixel at (0, 75) then Draws a red circle centered at (219, 106) with radius 61.
; PLAN: r0=278(x), r1=52(y), r2=118(width), r3=106(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=0(x), r6=75(y), r7=0xFF8800(color). Op: PSET r5, r6, r7 Next: r10=219(x), r11=106(y), r12=61(radius), r13=0xFF0000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 278
LDI r1, 52
LDI r2, 118
LDI r3, 106
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 0
LDI r6, 75
LDI r7, 0xFF8800
PSET r5, r6, r7
LDI r10, 219
LDI r11, 106
LDI r12, 61
LDI r13, 0xFF0000
CIRCLE r10, r11, r12, r13
HALT
