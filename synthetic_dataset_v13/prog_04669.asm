; DESCRIPTION: Composite: Places a purple 84x72 rectangle at position (325, 163) then Places a cyan dot at position (108, 109) then Renders a magenta disk with center (137, 155) and radius 53.
; PLAN: r0=325(x), r1=163(y), r2=84(width), r3=72(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=108(x), r6=109(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7 Next: r10=137(x), r11=155(y), r12=53(radius), r13=0xFF00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 325
LDI r1, 163
LDI r2, 84
LDI r3, 72
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 108
LDI r6, 109
LDI r7, 0x00FFFF
PSET r5, r6, r7
LDI r10, 137
LDI r11, 155
LDI r12, 53
LDI r13, 0xFF00FF
CIRCLE r10, r11, r12, r13
HALT
