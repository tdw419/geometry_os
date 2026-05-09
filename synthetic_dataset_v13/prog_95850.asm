; DESCRIPTION: Composite: Renders a red disk with center (199, 44) and radius 11 then Draws a purple rectangle at (484, 85) with width 11 and height 104 then Sets a single white pixel at (115, 202).
; PLAN: r0=199(x), r1=44(y), r2=11(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=484(x), r6=85(y), r7=11(width), r8=104(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=115(x), r11=202(y), r12=0xFFFFFF(color). Op: PSET r10, r11, r12.
LDI r0, 199
LDI r1, 44
LDI r2, 11
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 484
LDI r6, 85
LDI r7, 11
LDI r8, 104
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 115
LDI r11, 202
LDI r12, 0xFFFFFF
PSET r10, r11, r12
HALT
