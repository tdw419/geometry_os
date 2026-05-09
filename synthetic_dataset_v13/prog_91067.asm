; DESCRIPTION: Composite: Renders a blue line between points (163, 97) and (14, 69) then Draws a white circle centered at (205, 77) with radius 69 then Places a orange dot at position (497, 75).
; PLAN: r0=163(x1), r1=97(y1), r2=14(x2), r3=69(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=205(x), r6=77(y), r7=69(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=497(x), r11=75(y), r12=0xFF8800(color). Op: PSET r10, r11, r12.
LDI r0, 163
LDI r1, 97
LDI r2, 14
LDI r3, 69
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 205
LDI r6, 77
LDI r7, 69
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
LDI r10, 497
LDI r11, 75
LDI r12, 0xFF8800
PSET r10, r11, r12
HALT
