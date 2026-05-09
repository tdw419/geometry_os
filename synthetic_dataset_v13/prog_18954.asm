; DESCRIPTION: Composite: Sets a single orange pixel at (174, 43) then Places a orange circle of radius 74 at center (295, 110) then Draws a blue rectangle at (162, 175) with width 32 and height 75.
; PLAN: r0=174(x), r1=43(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=295(x), r6=110(y), r7=74(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=162(x), r11=175(y), r12=32(width), r13=75(height), r14=0x0000FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 174
LDI r1, 43
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 295
LDI r6, 110
LDI r7, 74
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
LDI r10, 162
LDI r11, 175
LDI r12, 32
LDI r13, 75
LDI r14, 0x0000FF
RECTF r10, r11, r12, r13, r14
HALT
