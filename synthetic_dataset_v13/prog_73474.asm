; DESCRIPTION: Composite: Draws a cyan circle centered at (365, 203) with radius 41 then Places a black line segment connecting (14, 165) to (448, 134) then Sets a single black pixel at (300, 180).
; PLAN: r0=365(x), r1=203(y), r2=41(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=14(x1), r6=165(y1), r7=448(x2), r8=134(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=300(x), r11=180(y), r12=0x000000(color). Op: PSET r10, r11, r12.
LDI r0, 365
LDI r1, 203
LDI r2, 41
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 14
LDI r6, 165
LDI r7, 448
LDI r8, 134
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
LDI r10, 300
LDI r11, 180
LDI r12, 0x000000
PSET r10, r11, r12
HALT
