; DESCRIPTION: Composite: Draws a orange rectangle at (50, 58) with width 11 and height 10 then Draws a purple circle centered at (360, 98) with radius 71 then Sets a single yellow pixel at (448, 74).
; PLAN: r0=50(x), r1=58(y), r2=11(width), r3=10(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=360(x), r6=98(y), r7=71(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=448(x), r11=74(y), r12=0xFFFF00(color). Op: PSET r10, r11, r12.
LDI r0, 50
LDI r1, 58
LDI r2, 11
LDI r3, 10
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 360
LDI r6, 98
LDI r7, 71
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
LDI r10, 448
LDI r11, 74
LDI r12, 0xFFFF00
PSET r10, r11, r12
HALT
