; DESCRIPTION: Composite: Draws a yellow rectangle at (53, 11) with width 37 and height 99 then Renders a blue disk with center (437, 110) and radius 62.
; PLAN: r0=53(x), r1=11(y), r2=37(width), r3=99(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=437(x), r6=110(y), r7=62(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 53
LDI r1, 11
LDI r2, 37
LDI r3, 99
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 437
LDI r6, 110
LDI r7, 62
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
HALT
