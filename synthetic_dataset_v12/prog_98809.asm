; DESCRIPTION: Composite: Draws a blue rectangle at (360, 84) with width 20 and height 87 then Sets a single green pixel at (427, 73) then Renders a blue disk with center (348, 154) and radius 72.
; PLAN: r0=360(x), r1=84(y), r2=20(width), r3=87(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=427(x), r6=73(y), r7=0x00FF00(color). Op: PSET r5, r6, r7 Next: r10=348(x), r11=154(y), r12=72(radius), r13=0x0000FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 360
LDI r1, 84
LDI r2, 20
LDI r3, 87
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 427
LDI r6, 73
LDI r7, 0x00FF00
PSET r5, r6, r7
LDI r10, 348
LDI r11, 154
LDI r12, 72
LDI r13, 0x0000FF
CIRCLE r10, r11, r12, r13
HALT
