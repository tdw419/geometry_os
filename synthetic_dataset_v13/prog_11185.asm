; DESCRIPTION: Composite: Renders a blue disk with center (80, 191) and radius 48 then Places a red dot at position (81, 147) then Renders a white box of size 51x24 starting at (289, 195).
; PLAN: r0=80(x), r1=191(y), r2=48(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=81(x), r6=147(y), r7=0xFF0000(color). Op: PSET r5, r6, r7 Next: r10=289(x), r11=195(y), r12=51(width), r13=24(height), r14=0xFFFFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 80
LDI r1, 191
LDI r2, 48
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 81
LDI r6, 147
LDI r7, 0xFF0000
PSET r5, r6, r7
LDI r10, 289
LDI r11, 195
LDI r12, 51
LDI r13, 24
LDI r14, 0xFFFFFF
RECTF r10, r11, r12, r13, r14
HALT
