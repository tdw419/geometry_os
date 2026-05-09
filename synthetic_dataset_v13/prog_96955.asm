; DESCRIPTION: Composite: Draws a yellow rectangle at (205, 53) with width 118 and height 94 then Creates a red circular shape at (474, 105) with radius 10.
; PLAN: r0=205(x), r1=53(y), r2=118(width), r3=94(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=474(x), r6=105(y), r7=10(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 205
LDI r1, 53
LDI r2, 118
LDI r3, 94
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 474
LDI r6, 105
LDI r7, 10
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
HALT
