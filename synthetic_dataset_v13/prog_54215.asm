; DESCRIPTION: Composite: Renders a black disk with center (331, 70) and radius 23 then Draws a orange rectangle at (287, 114) with width 114 and height 45.
; PLAN: r0=331(x), r1=70(y), r2=23(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=287(x), r6=114(y), r7=114(width), r8=45(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 331
LDI r1, 70
LDI r2, 23
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 287
LDI r6, 114
LDI r7, 114
LDI r8, 45
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
HALT
