; DESCRIPTION: Composite: Draws a blue circle centered at (407, 97) with radius 76 then Renders a yellow box of size 22x119 starting at (484, 39).
; PLAN: r0=407(x), r1=97(y), r2=76(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=484(x), r6=39(y), r7=22(width), r8=119(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 407
LDI r1, 97
LDI r2, 76
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 484
LDI r6, 39
LDI r7, 22
LDI r8, 119
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
HALT
