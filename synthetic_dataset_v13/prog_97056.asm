; DESCRIPTION: Composite: Creates a magenta rectangular region at (347, 37) spanning 24 by 41 pixels then Sets a single yellow pixel at (183, 219) then Draws a magenta circle centered at (40, 74) with radius 30.
; PLAN: r0=347(x), r1=37(y), r2=24(width), r3=41(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=183(x), r6=219(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7 Next: r10=40(x), r11=74(y), r12=30(radius), r13=0xFF00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 347
LDI r1, 37
LDI r2, 24
LDI r3, 41
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 183
LDI r6, 219
LDI r7, 0xFFFF00
PSET r5, r6, r7
LDI r10, 40
LDI r11, 74
LDI r12, 30
LDI r13, 0xFF00FF
CIRCLE r10, r11, r12, r13
HALT
