; DESCRIPTION: Composite: Draws a orange rectangle at (389, 154) with width 34 and height 65 then Creates a blue circular shape at (369, 178) with radius 57 then Sets a single purple pixel at (65, 185).
; PLAN: r0=389(x), r1=154(y), r2=34(width), r3=65(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=369(x), r6=178(y), r7=57(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=65(x), r11=185(y), r12=0xAA00FF(color). Op: PSET r10, r11, r12.
LDI r0, 389
LDI r1, 154
LDI r2, 34
LDI r3, 65
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 369
LDI r6, 178
LDI r7, 57
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
LDI r10, 65
LDI r11, 185
LDI r12, 0xAA00FF
PSET r10, r11, r12
HALT
