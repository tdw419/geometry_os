; DESCRIPTION: Composite: Draws a red circle centered at (194, 81) with radius 79 then Draws a blue rectangle at (130, 225) with width 98 and height 19.
; PLAN: r0=194(x), r1=81(y), r2=79(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=130(x), r6=225(y), r7=98(width), r8=19(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 194
LDI r1, 81
LDI r2, 79
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 130
LDI r6, 225
LDI r7, 98
LDI r8, 19
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
HALT
