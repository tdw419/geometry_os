; DESCRIPTION: Composite: Renders a green disk with center (331, 146) and radius 72 then Sets a single green pixel at (145, 74) then Places a black 69x81 rectangle at position (155, 104).
; PLAN: r0=331(x), r1=146(y), r2=72(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=145(x), r6=74(y), r7=0x00FF00(color). Op: PSET r5, r6, r7 Next: r10=155(x), r11=104(y), r12=69(width), r13=81(height), r14=0x000000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 331
LDI r1, 146
LDI r2, 72
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 145
LDI r6, 74
LDI r7, 0x00FF00
PSET r5, r6, r7
LDI r10, 155
LDI r11, 104
LDI r12, 69
LDI r13, 81
LDI r14, 0x000000
RECTF r10, r11, r12, r13, r14
HALT
