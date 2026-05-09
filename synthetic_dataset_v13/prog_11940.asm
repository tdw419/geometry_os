; DESCRIPTION: Composite: Places a red circle of radius 17 at center (390, 69) then Draws a purple rectangle at (11, 185) with width 111 and height 35 then Sets a single yellow pixel at (110, 72).
; PLAN: r0=390(x), r1=69(y), r2=17(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=11(x), r6=185(y), r7=111(width), r8=35(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=110(x), r11=72(y), r12=0xFFFF00(color). Op: PSET r10, r11, r12.
LDI r0, 390
LDI r1, 69
LDI r2, 17
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 11
LDI r6, 185
LDI r7, 111
LDI r8, 35
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 110
LDI r11, 72
LDI r12, 0xFFFF00
PSET r10, r11, r12
HALT
