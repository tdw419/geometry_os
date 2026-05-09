; DESCRIPTION: Composite: Creates a magenta circular shape at (41, 136) with radius 15 then Draws a orange line from (141, 254) to (487, 118) then Places a magenta dot at position (324, 156).
; PLAN: r0=41(x), r1=136(y), r2=15(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=141(x1), r6=254(y1), r7=487(x2), r8=118(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=324(x), r11=156(y), r12=0xFF00FF(color). Op: PSET r10, r11, r12.
LDI r0, 41
LDI r1, 136
LDI r2, 15
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 141
LDI r6, 254
LDI r7, 487
LDI r8, 118
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
LDI r10, 324
LDI r11, 156
LDI r12, 0xFF00FF
PSET r10, r11, r12
HALT
