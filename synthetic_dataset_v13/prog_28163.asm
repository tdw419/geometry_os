; DESCRIPTION: Composite: Draws a purple circle centered at (64, 62) with radius 56 then Renders a purple line between points (97, 164) and (208, 127) then Places a black dot at position (488, 18).
; PLAN: r0=64(x), r1=62(y), r2=56(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=97(x1), r6=164(y1), r7=208(x2), r8=127(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=488(x), r11=18(y), r12=0x000000(color). Op: PSET r10, r11, r12.
LDI r0, 64
LDI r1, 62
LDI r2, 56
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 97
LDI r6, 164
LDI r7, 208
LDI r8, 127
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
LDI r10, 488
LDI r11, 18
LDI r12, 0x000000
PSET r10, r11, r12
HALT
