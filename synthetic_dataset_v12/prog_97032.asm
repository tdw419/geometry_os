; DESCRIPTION: Composite: Draws a purple rectangle at (296, 64) with width 76 and height 115 then Creates a orange circular shape at (79, 40) with radius 25.
; PLAN: r0=296(x), r1=64(y), r2=76(width), r3=115(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=79(x), r6=40(y), r7=25(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 296
LDI r1, 64
LDI r2, 76
LDI r3, 115
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 79
LDI r6, 40
LDI r7, 25
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
HALT
