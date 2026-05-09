; DESCRIPTION: Composite: Renders a red disk with center (246, 89) and radius 49 then Places a purple dot at position (488, 29) then Draws a orange line from (336, 172) to (359, 172).
; PLAN: r0=246(x), r1=89(y), r2=49(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=488(x), r6=29(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7 Next: r10=336(x1), r11=172(y1), r12=359(x2), r13=172(y2), r14=0xFF8800(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 246
LDI r1, 89
LDI r2, 49
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 488
LDI r6, 29
LDI r7, 0xAA00FF
PSET r5, r6, r7
LDI r10, 336
LDI r11, 172
LDI r12, 359
LDI r13, 172
LDI r14, 0xFF8800
LINE r10, r11, r12, r13, r14
HALT
