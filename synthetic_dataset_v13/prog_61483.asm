; DESCRIPTION: Composite: Renders a blue box of size 95x67 starting at (259, 99) then Creates a blue circular shape at (87, 199) with radius 45.
; PLAN: r0=259(x), r1=99(y), r2=95(width), r3=67(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=87(x), r6=199(y), r7=45(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 259
LDI r1, 99
LDI r2, 95
LDI r3, 67
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 87
LDI r6, 199
LDI r7, 45
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
HALT
