; DESCRIPTION: Composite: Renders a white line between points (6, 125) and (339, 50) then Draws a orange circle centered at (142, 118) with radius 53 then Places a green dot at position (489, 239).
; PLAN: r0=6(x1), r1=125(y1), r2=339(x2), r3=50(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=142(x), r6=118(y), r7=53(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=489(x), r11=239(y), r12=0x00FF00(color). Op: PSET r10, r11, r12.
LDI r0, 6
LDI r1, 125
LDI r2, 339
LDI r3, 50
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 142
LDI r6, 118
LDI r7, 53
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
LDI r10, 489
LDI r11, 239
LDI r12, 0x00FF00
PSET r10, r11, r12
HALT
