; DESCRIPTION: Composite: Draws a orange rectangle at (338, 17) with width 80 and height 79 then Creates a blue circular shape at (227, 185) with radius 19.
; PLAN: r0=338(x), r1=17(y), r2=80(width), r3=79(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=227(x), r6=185(y), r7=19(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 338
LDI r1, 17
LDI r2, 80
LDI r3, 79
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 227
LDI r6, 185
LDI r7, 19
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
HALT
