; DESCRIPTION: Composite: Draws a yellow rectangle at (483, 104) with width 29 and height 66 then Creates a yellow circular shape at (242, 67) with radius 65.
; PLAN: r0=483(x), r1=104(y), r2=29(width), r3=66(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=242(x), r6=67(y), r7=65(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 483
LDI r1, 104
LDI r2, 29
LDI r3, 66
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 242
LDI r6, 67
LDI r7, 65
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
HALT
