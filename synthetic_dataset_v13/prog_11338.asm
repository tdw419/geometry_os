; DESCRIPTION: Composite: Places a magenta line segment connecting (90, 226) to (461, 0) then Places a yellow dot at position (49, 13) then Draws a white circle centered at (227, 14) with radius 13.
; PLAN: r0=90(x1), r1=226(y1), r2=461(x2), r3=0(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=49(x), r6=13(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7 Next: r10=227(x), r11=14(y), r12=13(radius), r13=0xFFFFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 90
LDI r1, 226
LDI r2, 461
LDI r3, 0
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 49
LDI r6, 13
LDI r7, 0xFFFF00
PSET r5, r6, r7
LDI r10, 227
LDI r11, 14
LDI r12, 13
LDI r13, 0xFFFFFF
CIRCLE r10, r11, r12, r13
HALT
