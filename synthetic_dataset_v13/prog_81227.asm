; DESCRIPTION: Composite: Places a red circle of radius 45 at center (98, 165) then Draws a orange rectangle at (221, 123) with width 83 and height 79.
; PLAN: r0=98(x), r1=165(y), r2=45(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=221(x), r6=123(y), r7=83(width), r8=79(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 98
LDI r1, 165
LDI r2, 45
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 221
LDI r6, 123
LDI r7, 83
LDI r8, 79
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
HALT
