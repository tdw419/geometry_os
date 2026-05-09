; DESCRIPTION: Composite: Draws a black circle centered at (267, 107) with radius 51 then Sets a single blue pixel at (87, 140) then Renders a blue line between points (410, 139) and (53, 251).
; PLAN: r0=267(x), r1=107(y), r2=51(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=87(x), r6=140(y), r7=0x0000FF(color). Op: PSET r5, r6, r7 Next: r10=410(x1), r11=139(y1), r12=53(x2), r13=251(y2), r14=0x0000FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 267
LDI r1, 107
LDI r2, 51
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 87
LDI r6, 140
LDI r7, 0x0000FF
PSET r5, r6, r7
LDI r10, 410
LDI r11, 139
LDI r12, 53
LDI r13, 251
LDI r14, 0x0000FF
LINE r10, r11, r12, r13, r14
HALT
