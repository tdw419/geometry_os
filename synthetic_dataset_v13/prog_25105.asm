; DESCRIPTION: Composite: Places a black circle of radius 14 at center (139, 40) then Draws a blue rectangle at (154, 18) with width 67 and height 31.
; PLAN: r0=139(x), r1=40(y), r2=14(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=154(x), r6=18(y), r7=67(width), r8=31(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 139
LDI r1, 40
LDI r2, 14
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 154
LDI r6, 18
LDI r7, 67
LDI r8, 31
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
HALT
