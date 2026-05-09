; DESCRIPTION: Composite: Draws a orange rectangle at (204, 118) with width 75 and height 98 then Places a red circle of radius 79 at center (356, 149).
; PLAN: r0=204(x), r1=118(y), r2=75(width), r3=98(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=356(x), r6=149(y), r7=79(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 204
LDI r1, 118
LDI r2, 75
LDI r3, 98
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 356
LDI r6, 149
LDI r7, 79
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
HALT
