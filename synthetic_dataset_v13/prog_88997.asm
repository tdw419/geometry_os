; DESCRIPTION: Composite: Draws a black rectangle at (326, 19) with width 45 and height 70 then Creates a magenta circular shape at (217, 12) with radius 10.
; PLAN: r0=326(x), r1=19(y), r2=45(width), r3=70(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=217(x), r6=12(y), r7=10(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 326
LDI r1, 19
LDI r2, 45
LDI r3, 70
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 217
LDI r6, 12
LDI r7, 10
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
HALT
