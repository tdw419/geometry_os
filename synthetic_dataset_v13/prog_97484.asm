; DESCRIPTION: Composite: Renders a black disk with center (321, 114) and radius 65 then Renders a magenta line between points (235, 18) and (490, 29) then Places a yellow dot at position (225, 41).
; PLAN: r0=321(x), r1=114(y), r2=65(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=235(x1), r6=18(y1), r7=490(x2), r8=29(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=225(x), r11=41(y), r12=0xFFFF00(color). Op: PSET r10, r11, r12.
LDI r0, 321
LDI r1, 114
LDI r2, 65
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 235
LDI r6, 18
LDI r7, 490
LDI r8, 29
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
LDI r10, 225
LDI r11, 41
LDI r12, 0xFFFF00
PSET r10, r11, r12
HALT
