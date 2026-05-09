; DESCRIPTION: Composite: Draws a magenta rectangle at (404, 105) with width 108 and height 28 then Creates a orange circular shape at (94, 103) with radius 18 then Sets a single orange pixel at (485, 12).
; PLAN: r0=404(x), r1=105(y), r2=108(width), r3=28(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=94(x), r6=103(y), r7=18(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=485(x), r11=12(y), r12=0xFF8800(color). Op: PSET r10, r11, r12.
LDI r0, 404
LDI r1, 105
LDI r2, 108
LDI r3, 28
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 94
LDI r6, 103
LDI r7, 18
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
LDI r10, 485
LDI r11, 12
LDI r12, 0xFF8800
PSET r10, r11, r12
HALT
