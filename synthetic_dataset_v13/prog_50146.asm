; DESCRIPTION: Composite: Draws a red circle centered at (281, 105) with radius 38 then Draws a orange rectangle at (118, 40) with width 113 and height 49.
; PLAN: r0=281(x), r1=105(y), r2=38(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=118(x), r6=40(y), r7=113(width), r8=49(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 281
LDI r1, 105
LDI r2, 38
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 118
LDI r6, 40
LDI r7, 113
LDI r8, 49
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
HALT
