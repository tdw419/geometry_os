; DESCRIPTION: Composite: Draws a orange rectangle at (266, 79) with width 95 and height 110 then Renders a blue disk with center (346, 98) and radius 66.
; PLAN: r0=266(x), r1=79(y), r2=95(width), r3=110(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=346(x), r6=98(y), r7=66(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 266
LDI r1, 79
LDI r2, 95
LDI r3, 110
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 346
LDI r6, 98
LDI r7, 66
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
HALT
