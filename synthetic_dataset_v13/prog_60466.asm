; DESCRIPTION: Composite: Renders a blue disk with center (343, 88) and radius 76 then Places a orange dot at position (455, 69) then Renders a purple line between points (344, 41) and (378, 214).
; PLAN: r0=343(x), r1=88(y), r2=76(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=455(x), r6=69(y), r7=0xFF8800(color). Op: PSET r5, r6, r7 Next: r10=344(x1), r11=41(y1), r12=378(x2), r13=214(y2), r14=0xAA00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 343
LDI r1, 88
LDI r2, 76
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 455
LDI r6, 69
LDI r7, 0xFF8800
PSET r5, r6, r7
LDI r10, 344
LDI r11, 41
LDI r12, 378
LDI r13, 214
LDI r14, 0xAA00FF
LINE r10, r11, r12, r13, r14
HALT
