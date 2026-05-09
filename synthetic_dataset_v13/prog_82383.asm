; DESCRIPTION: Composite: Draws a black rectangle at (176, 32) with width 116 and height 53 then Creates a green circular shape at (468, 138) with radius 25.
; PLAN: r0=176(x), r1=32(y), r2=116(width), r3=53(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=468(x), r6=138(y), r7=25(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 176
LDI r1, 32
LDI r2, 116
LDI r3, 53
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 468
LDI r6, 138
LDI r7, 25
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
HALT
