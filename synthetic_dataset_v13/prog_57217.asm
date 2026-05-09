; DESCRIPTION: Composite: Places a black 118x73 rectangle at position (122, 123) then Draws a magenta circle centered at (129, 79) with radius 16.
; PLAN: r0=122(x), r1=123(y), r2=118(width), r3=73(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=129(x), r6=79(y), r7=16(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 122
LDI r1, 123
LDI r2, 118
LDI r3, 73
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 129
LDI r6, 79
LDI r7, 16
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
HALT
