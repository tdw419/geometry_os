; DESCRIPTION: Composite: Places a yellow circle of radius 35 at center (319, 171) then Places a orange dot at position (350, 206) then Places a white line segment connecting (66, 234) to (162, 24).
; PLAN: r0=319(x), r1=171(y), r2=35(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=350(x), r6=206(y), r7=0xFF8800(color). Op: PSET r5, r6, r7 Next: r10=66(x1), r11=234(y1), r12=162(x2), r13=24(y2), r14=0xFFFFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 319
LDI r1, 171
LDI r2, 35
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 350
LDI r6, 206
LDI r7, 0xFF8800
PSET r5, r6, r7
LDI r10, 66
LDI r11, 234
LDI r12, 162
LDI r13, 24
LDI r14, 0xFFFFFF
LINE r10, r11, r12, r13, r14
HALT
