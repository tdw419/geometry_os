; DESCRIPTION: Composite: Creates a magenta circular shape at (118, 21) with radius 20 then Draws a yellow rectangle at (133, 96) with width 18 and height 35.
; PLAN: r0=118(x), r1=21(y), r2=20(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=133(x), r6=96(y), r7=18(width), r8=35(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 118
LDI r1, 21
LDI r2, 20
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 133
LDI r6, 96
LDI r7, 18
LDI r8, 35
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
HALT
