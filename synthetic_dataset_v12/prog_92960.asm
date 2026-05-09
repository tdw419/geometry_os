; DESCRIPTION: Composite: Renders a purple disk with center (71, 65) and radius 34 then Sets a single magenta pixel at (95, 78) then Creates a white rectangular region at (339, 58) spanning 89 by 49 pixels.
; PLAN: r0=71(x), r1=65(y), r2=34(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=95(x), r6=78(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7 Next: r10=339(x), r11=58(y), r12=89(width), r13=49(height), r14=0xFFFFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 71
LDI r1, 65
LDI r2, 34
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 95
LDI r6, 78
LDI r7, 0xFF00FF
PSET r5, r6, r7
LDI r10, 339
LDI r11, 58
LDI r12, 89
LDI r13, 49
LDI r14, 0xFFFFFF
RECTF r10, r11, r12, r13, r14
HALT
