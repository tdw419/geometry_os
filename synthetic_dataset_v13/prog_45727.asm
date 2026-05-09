; DESCRIPTION: Composite: Draws a blue rectangle at (83, 66) with width 105 and height 110 then Sets a single white pixel at (166, 3).
; PLAN: r0=83(x), r1=66(y), r2=105(width), r3=110(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=166(x), r6=3(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7.
LDI r0, 83
LDI r1, 66
LDI r2, 105
LDI r3, 110
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 166
LDI r6, 3
LDI r7, 0xFFFFFF
PSET r5, r6, r7
HALT
