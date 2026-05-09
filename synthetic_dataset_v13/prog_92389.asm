; DESCRIPTION: Composite: Renders a purple disk with center (69, 142) and radius 48 then Places a green dot at position (276, 147) then Creates a yellow rectangular region at (402, 131) spanning 36 by 39 pixels.
; PLAN: r0=69(x), r1=142(y), r2=48(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=276(x), r6=147(y), r7=0x00FF00(color). Op: PSET r5, r6, r7 Next: r10=402(x), r11=131(y), r12=36(width), r13=39(height), r14=0xFFFF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 69
LDI r1, 142
LDI r2, 48
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 276
LDI r6, 147
LDI r7, 0x00FF00
PSET r5, r6, r7
LDI r10, 402
LDI r11, 131
LDI r12, 36
LDI r13, 39
LDI r14, 0xFFFF00
RECTF r10, r11, r12, r13, r14
HALT
