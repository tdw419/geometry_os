; DESCRIPTION: Composite: Renders a black line between points (202, 79) and (88, 75) then Draws a orange circle centered at (270, 81) with radius 62 then Places a blue dot at position (265, 181).
; PLAN: r0=202(x1), r1=79(y1), r2=88(x2), r3=75(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=270(x), r6=81(y), r7=62(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=265(x), r11=181(y), r12=0x0000FF(color). Op: PSET r10, r11, r12.
LDI r0, 202
LDI r1, 79
LDI r2, 88
LDI r3, 75
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 270
LDI r6, 81
LDI r7, 62
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
LDI r10, 265
LDI r11, 181
LDI r12, 0x0000FF
PSET r10, r11, r12
HALT
