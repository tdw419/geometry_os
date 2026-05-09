; DESCRIPTION: Composite: Draws a blue rectangle at (222, 52) with width 75 and height 117 then Places a orange circle of radius 70 at center (170, 132) then Places a red dot at position (497, 165).
; PLAN: r0=222(x), r1=52(y), r2=75(width), r3=117(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=170(x), r6=132(y), r7=70(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=497(x), r11=165(y), r12=0xFF0000(color). Op: PSET r10, r11, r12.
LDI r0, 222
LDI r1, 52
LDI r2, 75
LDI r3, 117
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 170
LDI r6, 132
LDI r7, 70
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
LDI r10, 497
LDI r11, 165
LDI r12, 0xFF0000
PSET r10, r11, r12
HALT
