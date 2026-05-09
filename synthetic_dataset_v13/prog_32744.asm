; DESCRIPTION: Composite: Sets a single purple pixel at (33, 41) then Draws a white line from (4, 195) to (105, 98) then Renders a black disk with center (250, 79) and radius 57.
; PLAN: r0=33(x), r1=41(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=4(x1), r6=195(y1), r7=105(x2), r8=98(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=250(x), r11=79(y), r12=57(radius), r13=0x000000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 33
LDI r1, 41
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 4
LDI r6, 195
LDI r7, 105
LDI r8, 98
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
LDI r10, 250
LDI r11, 79
LDI r12, 57
LDI r13, 0x000000
CIRCLE r10, r11, r12, r13
HALT
