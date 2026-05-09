; DESCRIPTION: Composite: Renders a orange line between points (343, 47) and (166, 189) then Draws a blue circle centered at (155, 66) with radius 44 then Places a magenta dot at position (448, 179).
; PLAN: r0=343(x1), r1=47(y1), r2=166(x2), r3=189(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=155(x), r6=66(y), r7=44(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=448(x), r11=179(y), r12=0xFF00FF(color). Op: PSET r10, r11, r12.
LDI r0, 343
LDI r1, 47
LDI r2, 166
LDI r3, 189
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 155
LDI r6, 66
LDI r7, 44
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
LDI r10, 448
LDI r11, 179
LDI r12, 0xFF00FF
PSET r10, r11, r12
HALT
