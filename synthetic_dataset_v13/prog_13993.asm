; DESCRIPTION: Composite: Renders a green disk with center (378, 197) and radius 58 then Sets a single magenta pixel at (498, 20) then Places a white 81x44 rectangle at position (245, 116).
; PLAN: r0=378(x), r1=197(y), r2=58(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=498(x), r6=20(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7 Next: r10=245(x), r11=116(y), r12=81(width), r13=44(height), r14=0xFFFFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 378
LDI r1, 197
LDI r2, 58
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 498
LDI r6, 20
LDI r7, 0xFF00FF
PSET r5, r6, r7
LDI r10, 245
LDI r11, 116
LDI r12, 81
LDI r13, 44
LDI r14, 0xFFFFFF
RECTF r10, r11, r12, r13, r14
HALT
