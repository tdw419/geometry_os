; DESCRIPTION: Composite: Places a red circle of radius 65 at center (306, 87) then Draws a red rectangle at (409, 27) with width 94 and height 77.
; PLAN: r0=306(x), r1=87(y), r2=65(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=409(x), r6=27(y), r7=94(width), r8=77(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 306
LDI r1, 87
LDI r2, 65
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 409
LDI r6, 27
LDI r7, 94
LDI r8, 77
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
HALT
