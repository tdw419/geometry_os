; DESCRIPTION: Composite: Renders a yellow disk with center (316, 100) and radius 36 then Draws a green rectangle at (34, 216) with width 70 and height 36.
; PLAN: r0=316(x), r1=100(y), r2=36(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=34(x), r6=216(y), r7=70(width), r8=36(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 316
LDI r1, 100
LDI r2, 36
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 34
LDI r6, 216
LDI r7, 70
LDI r8, 36
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
HALT
