; DESCRIPTION: Composite: Draws a green rectangle at (100, 68) with width 10 and height 108 then Draws a purple circle centered at (324, 171) with radius 66.
; PLAN: r0=100(x), r1=68(y), r2=10(width), r3=108(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=324(x), r6=171(y), r7=66(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 100
LDI r1, 68
LDI r2, 10
LDI r3, 108
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 324
LDI r6, 171
LDI r7, 66
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
HALT
