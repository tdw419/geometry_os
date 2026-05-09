; DESCRIPTION: Composite: Places a magenta line segment connecting (51, 159) to (483, 138) then Renders a black disk with center (362, 120) and radius 49 then Places a orange dot at position (412, 115).
; PLAN: r0=51(x1), r1=159(y1), r2=483(x2), r3=138(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=362(x), r6=120(y), r7=49(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=412(x), r11=115(y), r12=0xFF8800(color). Op: PSET r10, r11, r12.
LDI r0, 51
LDI r1, 159
LDI r2, 483
LDI r3, 138
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 362
LDI r6, 120
LDI r7, 49
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
LDI r10, 412
LDI r11, 115
LDI r12, 0xFF8800
PSET r10, r11, r12
HALT
