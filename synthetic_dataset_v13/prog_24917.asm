; DESCRIPTION: Composite: Renders a green line between points (211, 241) and (359, 197) then Places a blue dot at position (88, 69) then Creates a green circular shape at (377, 82) with radius 40.
; PLAN: r0=211(x1), r1=241(y1), r2=359(x2), r3=197(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=88(x), r6=69(y), r7=0x0000FF(color). Op: PSET r5, r6, r7 Next: r10=377(x), r11=82(y), r12=40(radius), r13=0x00FF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 211
LDI r1, 241
LDI r2, 359
LDI r3, 197
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 88
LDI r6, 69
LDI r7, 0x0000FF
PSET r5, r6, r7
LDI r10, 377
LDI r11, 82
LDI r12, 40
LDI r13, 0x00FF00
CIRCLE r10, r11, r12, r13
HALT
