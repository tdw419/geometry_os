; DESCRIPTION: Composite: Draws a green rectangle at (108, 159) with width 19 and height 49 then Sets a single orange pixel at (150, 30) then Renders a yellow disk with center (109, 150) and radius 75.
; PLAN: r0=108(x), r1=159(y), r2=19(width), r3=49(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=150(x), r6=30(y), r7=0xFF8800(color). Op: PSET r5, r6, r7 Next: r10=109(x), r11=150(y), r12=75(radius), r13=0xFFFF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 108
LDI r1, 159
LDI r2, 19
LDI r3, 49
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 150
LDI r6, 30
LDI r7, 0xFF8800
PSET r5, r6, r7
LDI r10, 109
LDI r11, 150
LDI r12, 75
LDI r13, 0xFFFF00
CIRCLE r10, r11, r12, r13
HALT
