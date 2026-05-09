; DESCRIPTION: Composite: Draws a orange rectangle at (355, 25) with width 65 and height 102 then Draws a red circle centered at (207, 91) with radius 79.
; PLAN: r0=355(x), r1=25(y), r2=65(width), r3=102(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=207(x), r6=91(y), r7=79(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 355
LDI r1, 25
LDI r2, 65
LDI r3, 102
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 207
LDI r6, 91
LDI r7, 79
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
HALT
