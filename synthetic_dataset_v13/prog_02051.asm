; DESCRIPTION: Composite: Places a green dot at position (467, 237) then Renders a yellow disk with center (148, 159) and radius 65 then Places a purple 29x104 rectangle at position (245, 45).
; PLAN: r0=467(x), r1=237(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=148(x), r6=159(y), r7=65(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=245(x), r11=45(y), r12=29(width), r13=104(height), r14=0xAA00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 467
LDI r1, 237
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 148
LDI r6, 159
LDI r7, 65
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
LDI r10, 245
LDI r11, 45
LDI r12, 29
LDI r13, 104
LDI r14, 0xAA00FF
RECTF r10, r11, r12, r13, r14
HALT
