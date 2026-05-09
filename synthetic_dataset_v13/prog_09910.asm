; DESCRIPTION: Composite: Draws a orange circle centered at (227, 156) with radius 42 then Draws a green rectangle at (428, 127) with width 55 and height 118.
; PLAN: r0=227(x), r1=156(y), r2=42(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=428(x), r6=127(y), r7=55(width), r8=118(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 227
LDI r1, 156
LDI r2, 42
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 428
LDI r6, 127
LDI r7, 55
LDI r8, 118
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
HALT
