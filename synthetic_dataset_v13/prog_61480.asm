; DESCRIPTION: Composite: Draws a orange rectangle at (468, 116) with width 30 and height 94 then Renders a blue disk with center (59, 158) and radius 13.
; PLAN: r0=468(x), r1=116(y), r2=30(width), r3=94(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=59(x), r6=158(y), r7=13(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 468
LDI r1, 116
LDI r2, 30
LDI r3, 94
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 59
LDI r6, 158
LDI r7, 13
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
HALT
