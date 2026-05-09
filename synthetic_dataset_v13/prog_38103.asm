; DESCRIPTION: Composite: Draws a orange circle centered at (358, 140) with radius 49 then Places a purple dot at position (282, 53) then Places a cyan line segment connecting (424, 164) to (163, 238).
; PLAN: r0=358(x), r1=140(y), r2=49(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=282(x), r6=53(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7 Next: r10=424(x1), r11=164(y1), r12=163(x2), r13=238(y2), r14=0x00FFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 358
LDI r1, 140
LDI r2, 49
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 282
LDI r6, 53
LDI r7, 0xAA00FF
PSET r5, r6, r7
LDI r10, 424
LDI r11, 164
LDI r12, 163
LDI r13, 238
LDI r14, 0x00FFFF
LINE r10, r11, r12, r13, r14
HALT
