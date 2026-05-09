; DESCRIPTION: Composite: Sets a single green pixel at (166, 232) then Draws a magenta rectangle at (219, 188) with width 108 and height 25 then Draws a magenta circle centered at (261, 122) with radius 51.
; PLAN: r0=166(x), r1=232(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=219(x), r6=188(y), r7=108(width), r8=25(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=261(x), r11=122(y), r12=51(radius), r13=0xFF00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 166
LDI r1, 232
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 219
LDI r6, 188
LDI r7, 108
LDI r8, 25
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 261
LDI r11, 122
LDI r12, 51
LDI r13, 0xFF00FF
CIRCLE r10, r11, r12, r13
HALT
