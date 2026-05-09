; DESCRIPTION: Composite: Renders a purple line between points (421, 138) and (50, 235) then Places a blue dot at position (488, 233) then Creates a blue circular shape at (408, 191) with radius 24.
; PLAN: r0=421(x1), r1=138(y1), r2=50(x2), r3=235(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=488(x), r6=233(y), r7=0x0000FF(color). Op: PSET r5, r6, r7 Next: r10=408(x), r11=191(y), r12=24(radius), r13=0x0000FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 421
LDI r1, 138
LDI r2, 50
LDI r3, 235
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 488
LDI r6, 233
LDI r7, 0x0000FF
PSET r5, r6, r7
LDI r10, 408
LDI r11, 191
LDI r12, 24
LDI r13, 0x0000FF
CIRCLE r10, r11, r12, r13
HALT
