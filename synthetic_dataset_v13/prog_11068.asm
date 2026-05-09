; DESCRIPTION: Composite: Places a black circle of radius 28 at center (138, 137) then Places a black dot at position (322, 179) then Renders a magenta line between points (430, 249) and (41, 84).
; PLAN: r0=138(x), r1=137(y), r2=28(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=322(x), r6=179(y), r7=0x000000(color). Op: PSET r5, r6, r7 Next: r10=430(x1), r11=249(y1), r12=41(x2), r13=84(y2), r14=0xFF00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 138
LDI r1, 137
LDI r2, 28
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 322
LDI r6, 179
LDI r7, 0x000000
PSET r5, r6, r7
LDI r10, 430
LDI r11, 249
LDI r12, 41
LDI r13, 84
LDI r14, 0xFF00FF
LINE r10, r11, r12, r13, r14
HALT
