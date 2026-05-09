; DESCRIPTION: Composite: Renders a blue disk with center (289, 131) and radius 66 then Sets a single green pixel at (431, 34) then Places a white 62x19 rectangle at position (92, 115).
; PLAN: r0=289(x), r1=131(y), r2=66(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=431(x), r6=34(y), r7=0x00FF00(color). Op: PSET r5, r6, r7 Next: r10=92(x), r11=115(y), r12=62(width), r13=19(height), r14=0xFFFFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 289
LDI r1, 131
LDI r2, 66
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 431
LDI r6, 34
LDI r7, 0x00FF00
PSET r5, r6, r7
LDI r10, 92
LDI r11, 115
LDI r12, 62
LDI r13, 19
LDI r14, 0xFFFFFF
RECTF r10, r11, r12, r13, r14
HALT
