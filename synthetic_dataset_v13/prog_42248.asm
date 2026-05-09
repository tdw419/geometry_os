; DESCRIPTION: Composite: Renders a purple disk with center (338, 125) and radius 14 then Draws a blue rectangle at (373, 12) with width 100 and height 110.
; PLAN: r0=338(x), r1=125(y), r2=14(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=373(x), r6=12(y), r7=100(width), r8=110(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 338
LDI r1, 125
LDI r2, 14
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 373
LDI r6, 12
LDI r7, 100
LDI r8, 110
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
HALT
