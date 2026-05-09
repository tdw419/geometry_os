; DESCRIPTION: Composite: Draws a yellow rectangle at (144, 87) with width 78 and height 120 then Creates a purple circular shape at (259, 176) with radius 26.
; PLAN: r0=144(x), r1=87(y), r2=78(width), r3=120(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=259(x), r6=176(y), r7=26(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 144
LDI r1, 87
LDI r2, 78
LDI r3, 120
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 259
LDI r6, 176
LDI r7, 26
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
HALT
