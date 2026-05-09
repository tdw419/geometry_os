; DESCRIPTION: Composite: Places a purple 34x51 rectangle at position (169, 195) then Renders a black disk with center (356, 43) and radius 11 then Places a blue dot at position (141, 53).
; PLAN: r0=169(x), r1=195(y), r2=34(width), r3=51(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=356(x), r6=43(y), r7=11(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=141(x), r11=53(y), r12=0x0000FF(color). Op: PSET r10, r11, r12.
LDI r0, 169
LDI r1, 195
LDI r2, 34
LDI r3, 51
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 356
LDI r6, 43
LDI r7, 11
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
LDI r10, 141
LDI r11, 53
LDI r12, 0x0000FF
PSET r10, r11, r12
HALT
