; DESCRIPTION: Composite: Creates a yellow circular shape at (270, 78) with radius 62 then Places a white dot at position (267, 244) then Renders a blue line between points (334, 200) and (69, 138).
; PLAN: r0=270(x), r1=78(y), r2=62(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=267(x), r6=244(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7 Next: r10=334(x1), r11=200(y1), r12=69(x2), r13=138(y2), r14=0x0000FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 270
LDI r1, 78
LDI r2, 62
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 267
LDI r6, 244
LDI r7, 0xFFFFFF
PSET r5, r6, r7
LDI r10, 334
LDI r11, 200
LDI r12, 69
LDI r13, 138
LDI r14, 0x0000FF
LINE r10, r11, r12, r13, r14
HALT
