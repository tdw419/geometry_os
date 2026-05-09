; DESCRIPTION: Composite: Renders a white disk with center (146, 175) and radius 38 then Sets a single green pixel at (439, 134) then Creates a black rectangular region at (23, 65) spanning 58 by 55 pixels.
; PLAN: r0=146(x), r1=175(y), r2=38(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=439(x), r6=134(y), r7=0x00FF00(color). Op: PSET r5, r6, r7 Next: r10=23(x), r11=65(y), r12=58(width), r13=55(height), r14=0x000000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 146
LDI r1, 175
LDI r2, 38
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 439
LDI r6, 134
LDI r7, 0x00FF00
PSET r5, r6, r7
LDI r10, 23
LDI r11, 65
LDI r12, 58
LDI r13, 55
LDI r14, 0x000000
RECTF r10, r11, r12, r13, r14
HALT
