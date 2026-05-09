; DESCRIPTION: Composite: Draws a orange line from (60, 5) to (362, 235) then Places a white circle of radius 31 at center (369, 142) then Sets a single yellow pixel at (40, 235).
; PLAN: r0=60(x1), r1=5(y1), r2=362(x2), r3=235(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=369(x), r6=142(y), r7=31(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=40(x), r11=235(y), r12=0xFFFF00(color). Op: PSET r10, r11, r12.
LDI r0, 60
LDI r1, 5
LDI r2, 362
LDI r3, 235
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 369
LDI r6, 142
LDI r7, 31
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
LDI r10, 40
LDI r11, 235
LDI r12, 0xFFFF00
PSET r10, r11, r12
HALT
