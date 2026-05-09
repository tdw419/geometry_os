; DESCRIPTION: Composite: Renders a white line between points (510, 254) and (192, 79) then Places a magenta dot at position (293, 81) then Renders a orange disk with center (118, 185) and radius 37.
; PLAN: r0=510(x1), r1=254(y1), r2=192(x2), r3=79(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=293(x), r6=81(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7 Next: r10=118(x), r11=185(y), r12=37(radius), r13=0xFF8800(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 510
LDI r1, 254
LDI r2, 192
LDI r3, 79
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 293
LDI r6, 81
LDI r7, 0xFF00FF
PSET r5, r6, r7
LDI r10, 118
LDI r11, 185
LDI r12, 37
LDI r13, 0xFF8800
CIRCLE r10, r11, r12, r13
HALT
