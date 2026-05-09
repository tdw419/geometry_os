; DESCRIPTION: Composite: Places a blue circle of radius 78 at center (161, 125) then Renders a yellow line between points (68, 185) and (174, 244) then Sets a single yellow pixel at (409, 78).
; PLAN: r0=161(x), r1=125(y), r2=78(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=68(x1), r6=185(y1), r7=174(x2), r8=244(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=409(x), r11=78(y), r12=0xFFFF00(color). Op: PSET r10, r11, r12.
LDI r0, 161
LDI r1, 125
LDI r2, 78
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 68
LDI r6, 185
LDI r7, 174
LDI r8, 244
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
LDI r10, 409
LDI r11, 78
LDI r12, 0xFFFF00
PSET r10, r11, r12
HALT
