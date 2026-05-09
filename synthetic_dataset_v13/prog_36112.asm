; DESCRIPTION: Composite: Draws a orange rectangle at (67, 33) with width 75 and height 118 then Renders a orange disk with center (461, 39) and radius 31.
; PLAN: r0=67(x), r1=33(y), r2=75(width), r3=118(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=461(x), r6=39(y), r7=31(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 67
LDI r1, 33
LDI r2, 75
LDI r3, 118
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 461
LDI r6, 39
LDI r7, 31
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
HALT
