; DESCRIPTION: Composite: Draws a orange line from (474, 88) to (355, 87) then Creates a blue circular shape at (143, 205) with radius 33 then Places a black dot at position (419, 230).
; PLAN: r0=474(x1), r1=88(y1), r2=355(x2), r3=87(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=143(x), r6=205(y), r7=33(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=419(x), r11=230(y), r12=0x000000(color). Op: PSET r10, r11, r12.
LDI r0, 474
LDI r1, 88
LDI r2, 355
LDI r3, 87
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 143
LDI r6, 205
LDI r7, 33
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
LDI r10, 419
LDI r11, 230
LDI r12, 0x000000
PSET r10, r11, r12
HALT
