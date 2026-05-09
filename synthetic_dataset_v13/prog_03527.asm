; DESCRIPTION: Composite: Renders a blue disk with center (125, 33) and radius 26 then Draws a orange rectangle at (75, 138) with width 72 and height 74.
; PLAN: r0=125(x), r1=33(y), r2=26(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=75(x), r6=138(y), r7=72(width), r8=74(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 125
LDI r1, 33
LDI r2, 26
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 75
LDI r6, 138
LDI r7, 72
LDI r8, 74
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
HALT
