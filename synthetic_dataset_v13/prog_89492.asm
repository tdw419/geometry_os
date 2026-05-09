; DESCRIPTION: Composite: Creates a black circular shape at (103, 123) with radius 63 then Draws a yellow rectangle at (435, 113) with width 25 and height 118.
; PLAN: r0=103(x), r1=123(y), r2=63(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=435(x), r6=113(y), r7=25(width), r8=118(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 103
LDI r1, 123
LDI r2, 63
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 435
LDI r6, 113
LDI r7, 25
LDI r8, 118
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
HALT
