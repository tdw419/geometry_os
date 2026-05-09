; DESCRIPTION: Composite: Draws a yellow rectangle at (249, 142) with width 107 and height 88 then Draws a cyan circle centered at (240, 139) with radius 38.
; PLAN: r0=249(x), r1=142(y), r2=107(width), r3=88(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=240(x), r6=139(y), r7=38(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 249
LDI r1, 142
LDI r2, 107
LDI r3, 88
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 240
LDI r6, 139
LDI r7, 38
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
HALT
