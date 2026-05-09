; DESCRIPTION: Composite: Renders a purple disk with center (182, 170) and radius 10 then Sets a single black pixel at (410, 222) then Creates a white rectangular region at (251, 55) spanning 28 by 119 pixels.
; PLAN: r0=182(x), r1=170(y), r2=10(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=410(x), r6=222(y), r7=0x000000(color). Op: PSET r5, r6, r7 Next: r10=251(x), r11=55(y), r12=28(width), r13=119(height), r14=0xFFFFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 182
LDI r1, 170
LDI r2, 10
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 410
LDI r6, 222
LDI r7, 0x000000
PSET r5, r6, r7
LDI r10, 251
LDI r11, 55
LDI r12, 28
LDI r13, 119
LDI r14, 0xFFFFFF
RECTF r10, r11, r12, r13, r14
HALT
