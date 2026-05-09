; DESCRIPTION: Composite: Draws a purple circle centered at (291, 135) with radius 66 then Draws a yellow rectangle at (117, 87) with width 94 and height 76.
; PLAN: r0=291(x), r1=135(y), r2=66(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=117(x), r6=87(y), r7=94(width), r8=76(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 291
LDI r1, 135
LDI r2, 66
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 117
LDI r6, 87
LDI r7, 94
LDI r8, 76
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
HALT
