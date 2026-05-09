; DESCRIPTION: Composite: Places a purple dot at position (488, 1) then Draws a orange circle centered at (243, 93) with radius 51 then Draws a white line from (139, 199) to (389, 130).
; PLAN: r0=488(x), r1=1(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=243(x), r6=93(y), r7=51(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=139(x1), r11=199(y1), r12=389(x2), r13=130(y2), r14=0xFFFFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 488
LDI r1, 1
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 243
LDI r6, 93
LDI r7, 51
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
LDI r10, 139
LDI r11, 199
LDI r12, 389
LDI r13, 130
LDI r14, 0xFFFFFF
LINE r10, r11, r12, r13, r14
HALT
