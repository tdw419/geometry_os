; DESCRIPTION: Composite: Creates a cyan rectangular region at (373, 94) spanning 40 by 21 pixels then Renders a blue disk with center (34, 203) and radius 33 then Sets a single black pixel at (511, 253).
; PLAN: r0=373(x), r1=94(y), r2=40(width), r3=21(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=34(x), r6=203(y), r7=33(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=511(x), r11=253(y), r12=0x000000(color). Op: PSET r10, r11, r12.
LDI r0, 373
LDI r1, 94
LDI r2, 40
LDI r3, 21
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 34
LDI r6, 203
LDI r7, 33
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
LDI r10, 511
LDI r11, 253
LDI r12, 0x000000
PSET r10, r11, r12
HALT
