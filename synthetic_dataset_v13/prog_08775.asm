; DESCRIPTION: Composite: Draws a green rectangle at (366, 177) with width 89 and height 33 then Draws a yellow circle centered at (385, 12) with radius 11.
; PLAN: r0=366(x), r1=177(y), r2=89(width), r3=33(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=385(x), r6=12(y), r7=11(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 366
LDI r1, 177
LDI r2, 89
LDI r3, 33
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 385
LDI r6, 12
LDI r7, 11
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
HALT
