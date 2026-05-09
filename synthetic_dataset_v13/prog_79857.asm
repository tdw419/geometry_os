; DESCRIPTION: Composite: Renders a blue disk with center (308, 81) and radius 75 then Draws a orange rectangle at (312, 79) with width 100 and height 13.
; PLAN: r0=308(x), r1=81(y), r2=75(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=312(x), r6=79(y), r7=100(width), r8=13(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 308
LDI r1, 81
LDI r2, 75
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 312
LDI r6, 79
LDI r7, 100
LDI r8, 13
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
HALT
