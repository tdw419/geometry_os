; DESCRIPTION: Composite: Creates a purple circular shape at (359, 178) with radius 62 then Renders a blue box of size 90x36 starting at (250, 26).
; PLAN: r0=359(x), r1=178(y), r2=62(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=250(x), r6=26(y), r7=90(width), r8=36(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 359
LDI r1, 178
LDI r2, 62
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 250
LDI r6, 26
LDI r7, 90
LDI r8, 36
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
HALT
