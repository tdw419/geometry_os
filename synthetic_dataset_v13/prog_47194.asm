; DESCRIPTION: Composite: Sets a single white pixel at (465, 181) then Draws a orange circle centered at (159, 180) with radius 33 then Draws a black line from (508, 139) to (26, 2).
; PLAN: r0=465(x), r1=181(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=159(x), r6=180(y), r7=33(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=508(x1), r11=139(y1), r12=26(x2), r13=2(y2), r14=0x000000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 465
LDI r1, 181
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 159
LDI r6, 180
LDI r7, 33
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
LDI r10, 508
LDI r11, 139
LDI r12, 26
LDI r13, 2
LDI r14, 0x000000
LINE r10, r11, r12, r13, r14
HALT
