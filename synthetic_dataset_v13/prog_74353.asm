; DESCRIPTION: Composite: Renders a purple line between points (292, 153) and (424, 51) then Draws a blue circle centered at (461, 50) with radius 21 then Places a yellow dot at position (71, 133).
; PLAN: r0=292(x1), r1=153(y1), r2=424(x2), r3=51(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=461(x), r6=50(y), r7=21(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=71(x), r11=133(y), r12=0xFFFF00(color). Op: PSET r10, r11, r12.
LDI r0, 292
LDI r1, 153
LDI r2, 424
LDI r3, 51
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 461
LDI r6, 50
LDI r7, 21
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
LDI r10, 71
LDI r11, 133
LDI r12, 0xFFFF00
PSET r10, r11, r12
HALT
