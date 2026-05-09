; DESCRIPTION: Composite: Creates a blue circular shape at (421, 83) with radius 49 then Draws a white rectangle at (170, 38) with width 10 and height 59.
; PLAN: r0=421(x), r1=83(y), r2=49(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=170(x), r6=38(y), r7=10(width), r8=59(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 421
LDI r1, 83
LDI r2, 49
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 170
LDI r6, 38
LDI r7, 10
LDI r8, 59
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
HALT
