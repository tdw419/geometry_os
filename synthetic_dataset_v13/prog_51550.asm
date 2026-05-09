; DESCRIPTION: Composite: Places a orange circle of radius 17 at center (124, 81) then Draws a red rectangle at (67, 124) with width 105 and height 102.
; PLAN: r0=124(x), r1=81(y), r2=17(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=67(x), r6=124(y), r7=105(width), r8=102(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 124
LDI r1, 81
LDI r2, 17
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 67
LDI r6, 124
LDI r7, 105
LDI r8, 102
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
HALT
