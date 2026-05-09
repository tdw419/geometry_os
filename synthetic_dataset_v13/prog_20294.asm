; DESCRIPTION: Composite: Places a purple circle of radius 46 at center (307, 115) then Sets a single purple pixel at (347, 3) then Draws a white rectangle at (3, 50) with width 109 and height 38.
; PLAN: r0=307(x), r1=115(y), r2=46(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=347(x), r6=3(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7 Next: r10=3(x), r11=50(y), r12=109(width), r13=38(height), r14=0xFFFFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 307
LDI r1, 115
LDI r2, 46
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 347
LDI r6, 3
LDI r7, 0xAA00FF
PSET r5, r6, r7
LDI r10, 3
LDI r11, 50
LDI r12, 109
LDI r13, 38
LDI r14, 0xFFFFFF
RECTF r10, r11, r12, r13, r14
HALT
