; DESCRIPTION: Composite: Places a magenta 88x84 rectangle at position (188, 90) then Creates a black circular shape at (126, 123) with radius 80.
; PLAN: r0=188(x), r1=90(y), r2=88(width), r3=84(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=126(x), r6=123(y), r7=80(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 188
LDI r1, 90
LDI r2, 88
LDI r3, 84
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 126
LDI r6, 123
LDI r7, 80
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
HALT
