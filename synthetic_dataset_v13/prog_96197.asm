; DESCRIPTION: Composite: Places a blue dot at position (93, 172) then Places a white circle of radius 51 at center (309, 119) then Renders a magenta line between points (508, 181) and (68, 132).
; PLAN: r0=93(x), r1=172(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=309(x), r6=119(y), r7=51(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=508(x1), r11=181(y1), r12=68(x2), r13=132(y2), r14=0xFF00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 93
LDI r1, 172
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 309
LDI r6, 119
LDI r7, 51
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
LDI r10, 508
LDI r11, 181
LDI r12, 68
LDI r13, 132
LDI r14, 0xFF00FF
LINE r10, r11, r12, r13, r14
HALT
