; DESCRIPTION: Composite: Places a black circle of radius 54 at center (197, 144) then Sets a single green pixel at (446, 142) then Creates a black rectangular region at (126, 175) spanning 91 by 55 pixels.
; PLAN: r0=197(x), r1=144(y), r2=54(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=446(x), r6=142(y), r7=0x00FF00(color). Op: PSET r5, r6, r7 Next: r10=126(x), r11=175(y), r12=91(width), r13=55(height), r14=0x000000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 197
LDI r1, 144
LDI r2, 54
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 446
LDI r6, 142
LDI r7, 0x00FF00
PSET r5, r6, r7
LDI r10, 126
LDI r11, 175
LDI r12, 91
LDI r13, 55
LDI r14, 0x000000
RECTF r10, r11, r12, r13, r14
HALT
