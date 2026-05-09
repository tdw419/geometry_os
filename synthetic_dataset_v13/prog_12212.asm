; DESCRIPTION: Composite: Draws a yellow rectangle at (359, 13) with width 18 and height 59 then Places a red circle of radius 13 at center (67, 166).
; PLAN: r0=359(x), r1=13(y), r2=18(width), r3=59(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=67(x), r6=166(y), r7=13(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 359
LDI r1, 13
LDI r2, 18
LDI r3, 59
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 67
LDI r6, 166
LDI r7, 13
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
HALT
