; DESCRIPTION: Composite: Places a blue circle of radius 62 at center (325, 90) then Draws a magenta rectangle at (342, 15) with width 72 and height 51 then Sets a single green pixel at (511, 233).
; PLAN: r0=325(x), r1=90(y), r2=62(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=342(x), r6=15(y), r7=72(width), r8=51(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=511(x), r11=233(y), r12=0x00FF00(color). Op: PSET r10, r11, r12.
LDI r0, 325
LDI r1, 90
LDI r2, 62
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 342
LDI r6, 15
LDI r7, 72
LDI r8, 51
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 511
LDI r11, 233
LDI r12, 0x00FF00
PSET r10, r11, r12
HALT
