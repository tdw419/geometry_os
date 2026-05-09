; DESCRIPTION: Composite: Draws a orange line from (347, 44) to (206, 19) then Places a white dot at position (211, 75) then Renders a orange disk with center (249, 183) and radius 69.
; PLAN: r0=347(x1), r1=44(y1), r2=206(x2), r3=19(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=211(x), r6=75(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7 Next: r10=249(x), r11=183(y), r12=69(radius), r13=0xFF8800(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 347
LDI r1, 44
LDI r2, 206
LDI r3, 19
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 211
LDI r6, 75
LDI r7, 0xFFFFFF
PSET r5, r6, r7
LDI r10, 249
LDI r11, 183
LDI r12, 69
LDI r13, 0xFF8800
CIRCLE r10, r11, r12, r13
HALT
