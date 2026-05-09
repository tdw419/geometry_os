; DESCRIPTION: Composite: Places a orange circle of radius 41 at center (372, 68) then Draws a white line from (75, 18) to (211, 165) then Sets a single white pixel at (235, 67).
; PLAN: r0=372(x), r1=68(y), r2=41(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=75(x1), r6=18(y1), r7=211(x2), r8=165(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=235(x), r11=67(y), r12=0xFFFFFF(color). Op: PSET r10, r11, r12.
LDI r0, 372
LDI r1, 68
LDI r2, 41
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 75
LDI r6, 18
LDI r7, 211
LDI r8, 165
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
LDI r10, 235
LDI r11, 67
LDI r12, 0xFFFFFF
PSET r10, r11, r12
HALT
