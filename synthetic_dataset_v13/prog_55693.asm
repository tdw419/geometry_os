; DESCRIPTION: Composite: Renders a black disk with center (244, 72) and radius 60 then Sets a single yellow pixel at (492, 250) then Creates a green rectangular region at (82, 82) spanning 10 by 36 pixels.
; PLAN: r0=244(x), r1=72(y), r2=60(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=492(x), r6=250(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7 Next: r10=82(x), r11=82(y), r12=10(width), r13=36(height), r14=0x00FF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 244
LDI r1, 72
LDI r2, 60
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 492
LDI r6, 250
LDI r7, 0xFFFF00
PSET r5, r6, r7
LDI r10, 82
LDI r11, 82
LDI r12, 10
LDI r13, 36
LDI r14, 0x00FF00
RECTF r10, r11, r12, r13, r14
HALT
