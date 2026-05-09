; DESCRIPTION: Composite: Renders a red box of size 78x76 starting at (339, 176) then Draws a blue line from (265, 235) to (257, 93) then Creates a orange circular shape at (299, 78) with radius 38.
; PLAN: r0=339(x), r1=176(y), r2=78(width), r3=76(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=265(x1), r6=235(y1), r7=257(x2), r8=93(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=299(x), r11=78(y), r12=38(radius), r13=0xFF8800(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 339
LDI r1, 176
LDI r2, 78
LDI r3, 76
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 265
LDI r6, 235
LDI r7, 257
LDI r8, 93
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
LDI r10, 299
LDI r11, 78
LDI r12, 38
LDI r13, 0xFF8800
CIRCLE r10, r11, r12, r13
HALT
