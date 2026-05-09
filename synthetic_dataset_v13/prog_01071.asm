; DESCRIPTION: Composite: Draws a blue circle centered at (430, 120) with radius 54 then Draws a green rectangle at (413, 53) with width 77 and height 97.
; PLAN: r0=430(x), r1=120(y), r2=54(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=413(x), r6=53(y), r7=77(width), r8=97(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 430
LDI r1, 120
LDI r2, 54
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 413
LDI r6, 53
LDI r7, 77
LDI r8, 97
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
HALT
