; DESCRIPTION: Composite: Draws a orange circle centered at (395, 148) with radius 79 then Creates a white rectangular region at (453, 136) spanning 52 by 96 pixels.
; PLAN: r0=395(x), r1=148(y), r2=79(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=453(x), r6=136(y), r7=52(width), r8=96(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 395
LDI r1, 148
LDI r2, 79
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 453
LDI r6, 136
LDI r7, 52
LDI r8, 96
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
HALT
