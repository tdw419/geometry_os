; DESCRIPTION: Composite: Places a green circle of radius 71 at center (428, 170) then Draws a blue rectangle at (276, 133) with width 71 and height 119.
; PLAN: r0=428(x), r1=170(y), r2=71(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=276(x), r6=133(y), r7=71(width), r8=119(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 428
LDI r1, 170
LDI r2, 71
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 276
LDI r6, 133
LDI r7, 71
LDI r8, 119
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
HALT
