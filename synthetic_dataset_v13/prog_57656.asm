; DESCRIPTION: Composite: Renders a blue disk with center (388, 159) and radius 44 then Sets a single blue pixel at (248, 237) then Places a black 52x33 rectangle at position (136, 187).
; PLAN: r0=388(x), r1=159(y), r2=44(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=248(x), r6=237(y), r7=0x0000FF(color). Op: PSET r5, r6, r7 Next: r10=136(x), r11=187(y), r12=52(width), r13=33(height), r14=0x000000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 388
LDI r1, 159
LDI r2, 44
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 248
LDI r6, 237
LDI r7, 0x0000FF
PSET r5, r6, r7
LDI r10, 136
LDI r11, 187
LDI r12, 52
LDI r13, 33
LDI r14, 0x000000
RECTF r10, r11, r12, r13, r14
HALT
