; DESCRIPTION: Composite: Places a red line segment connecting (458, 155) to (111, 4) then Draws a yellow circle centered at (291, 174) with radius 51 then Places a black dot at position (195, 69).
; PLAN: r0=458(x1), r1=155(y1), r2=111(x2), r3=4(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=291(x), r6=174(y), r7=51(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=195(x), r11=69(y), r12=0x000000(color). Op: PSET r10, r11, r12.
LDI r0, 458
LDI r1, 155
LDI r2, 111
LDI r3, 4
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 291
LDI r6, 174
LDI r7, 51
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
LDI r10, 195
LDI r11, 69
LDI r12, 0x000000
PSET r10, r11, r12
HALT
