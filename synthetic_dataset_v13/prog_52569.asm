; DESCRIPTION: Composite: Places a cyan circle of radius 51 at center (90, 142) then Places a green dot at position (248, 140) then Creates a white rectangular region at (391, 105) spanning 40 by 21 pixels.
; PLAN: r0=90(x), r1=142(y), r2=51(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=248(x), r6=140(y), r7=0x00FF00(color). Op: PSET r5, r6, r7 Next: r10=391(x), r11=105(y), r12=40(width), r13=21(height), r14=0xFFFFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 90
LDI r1, 142
LDI r2, 51
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 248
LDI r6, 140
LDI r7, 0x00FF00
PSET r5, r6, r7
LDI r10, 391
LDI r11, 105
LDI r12, 40
LDI r13, 21
LDI r14, 0xFFFFFF
RECTF r10, r11, r12, r13, r14
HALT
