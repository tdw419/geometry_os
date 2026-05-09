; DESCRIPTION: Composite: Renders a black line between points (4, 127) and (342, 159) then Places a magenta dot at position (233, 216) then Draws a white circle centered at (126, 93) with radius 58.
; PLAN: r0=4(x1), r1=127(y1), r2=342(x2), r3=159(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=233(x), r6=216(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7 Next: r10=126(x), r11=93(y), r12=58(radius), r13=0xFFFFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 4
LDI r1, 127
LDI r2, 342
LDI r3, 159
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 233
LDI r6, 216
LDI r7, 0xFF00FF
PSET r5, r6, r7
LDI r10, 126
LDI r11, 93
LDI r12, 58
LDI r13, 0xFFFFFF
CIRCLE r10, r11, r12, r13
HALT
