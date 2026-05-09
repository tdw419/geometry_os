; DESCRIPTION: Composite: Draws a green rectangle at (47, 41) with width 87 and height 72 then Sets a single orange pixel at (150, 131) then Creates a orange circular shape at (127, 186) with radius 18.
; PLAN: r0=47(x), r1=41(y), r2=87(width), r3=72(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=150(x), r6=131(y), r7=0xFF8800(color). Op: PSET r5, r6, r7 Next: r10=127(x), r11=186(y), r12=18(radius), r13=0xFF8800(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 47
LDI r1, 41
LDI r2, 87
LDI r3, 72
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 150
LDI r6, 131
LDI r7, 0xFF8800
PSET r5, r6, r7
LDI r10, 127
LDI r11, 186
LDI r12, 18
LDI r13, 0xFF8800
CIRCLE r10, r11, r12, r13
HALT
