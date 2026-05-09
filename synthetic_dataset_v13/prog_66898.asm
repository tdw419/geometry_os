; DESCRIPTION: Composite: Draws a red circle centered at (362, 145) with radius 34 then Draws a black line from (456, 19) to (85, 110) then Places a black dot at position (159, 150).
; PLAN: r0=362(x), r1=145(y), r2=34(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=456(x1), r6=19(y1), r7=85(x2), r8=110(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=159(x), r11=150(y), r12=0x000000(color). Op: PSET r10, r11, r12.
LDI r0, 362
LDI r1, 145
LDI r2, 34
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 456
LDI r6, 19
LDI r7, 85
LDI r8, 110
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
LDI r10, 159
LDI r11, 150
LDI r12, 0x000000
PSET r10, r11, r12
HALT
