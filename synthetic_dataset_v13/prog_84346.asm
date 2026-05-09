; DESCRIPTION: Composite: Draws a yellow rectangle at (37, 76) with width 44 and height 50 then Creates a green circular shape at (96, 71) with radius 40.
; PLAN: r0=37(x), r1=76(y), r2=44(width), r3=50(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=96(x), r6=71(y), r7=40(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 37
LDI r1, 76
LDI r2, 44
LDI r3, 50
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 96
LDI r6, 71
LDI r7, 40
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
HALT
