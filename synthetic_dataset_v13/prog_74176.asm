; DESCRIPTION: Composite: Sets a single orange pixel at (114, 107) then Places a black line segment connecting (125, 54) to (268, 236) then Renders a purple disk with center (82, 146) and radius 78.
; PLAN: r0=114(x), r1=107(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=125(x1), r6=54(y1), r7=268(x2), r8=236(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=82(x), r11=146(y), r12=78(radius), r13=0xAA00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 114
LDI r1, 107
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 125
LDI r6, 54
LDI r7, 268
LDI r8, 236
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
LDI r10, 82
LDI r11, 146
LDI r12, 78
LDI r13, 0xAA00FF
CIRCLE r10, r11, r12, r13
HALT
