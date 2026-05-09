; DESCRIPTION: Composite: Draws a magenta rectangle at (68, 67) with width 45 and height 79 then Creates a black circular shape at (456, 53) with radius 20.
; PLAN: r0=68(x), r1=67(y), r2=45(width), r3=79(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=456(x), r6=53(y), r7=20(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 68
LDI r1, 67
LDI r2, 45
LDI r3, 79
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 456
LDI r6, 53
LDI r7, 20
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
HALT
