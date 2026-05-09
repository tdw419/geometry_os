; DESCRIPTION: Composite: Renders a white disk with center (268, 132) and radius 66 then Sets a single black pixel at (508, 17) then Creates a white rectangular region at (177, 134) spanning 80 by 30 pixels.
; PLAN: r0=268(x), r1=132(y), r2=66(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=508(x), r6=17(y), r7=0x000000(color). Op: PSET r5, r6, r7 Next: r10=177(x), r11=134(y), r12=80(width), r13=30(height), r14=0xFFFFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 268
LDI r1, 132
LDI r2, 66
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 508
LDI r6, 17
LDI r7, 0x000000
PSET r5, r6, r7
LDI r10, 177
LDI r11, 134
LDI r12, 80
LDI r13, 30
LDI r14, 0xFFFFFF
RECTF r10, r11, r12, r13, r14
HALT
