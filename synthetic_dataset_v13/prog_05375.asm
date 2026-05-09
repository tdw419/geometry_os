; DESCRIPTION: Composite: Draws a purple rectangle at (211, 94) with width 44 and height 105 then Sets a single white pixel at (490, 59) then Places a yellow circle of radius 77 at center (117, 172).
; PLAN: r0=211(x), r1=94(y), r2=44(width), r3=105(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=490(x), r6=59(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7 Next: r10=117(x), r11=172(y), r12=77(radius), r13=0xFFFF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 211
LDI r1, 94
LDI r2, 44
LDI r3, 105
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 490
LDI r6, 59
LDI r7, 0xFFFFFF
PSET r5, r6, r7
LDI r10, 117
LDI r11, 172
LDI r12, 77
LDI r13, 0xFFFF00
CIRCLE r10, r11, r12, r13
HALT
