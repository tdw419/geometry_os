; DESCRIPTION: Composite: Creates a purple circular shape at (33, 171) with radius 22 then Draws a orange rectangle at (239, 155) with width 22 and height 34.
; PLAN: r0=33(x), r1=171(y), r2=22(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=239(x), r6=155(y), r7=22(width), r8=34(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 33
LDI r1, 171
LDI r2, 22
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 239
LDI r6, 155
LDI r7, 22
LDI r8, 34
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
HALT
