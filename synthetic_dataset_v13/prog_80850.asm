; DESCRIPTION: Composite: Places a magenta 14x32 rectangle at position (179, 122) then Draws a orange circle centered at (361, 118) with radius 31.
; PLAN: r0=179(x), r1=122(y), r2=14(width), r3=32(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=361(x), r6=118(y), r7=31(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 179
LDI r1, 122
LDI r2, 14
LDI r3, 32
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 361
LDI r6, 118
LDI r7, 31
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
HALT
