; DESCRIPTION: Composite: Creates a black rectangular region at (393, 48) spanning 18 by 90 pixels then Renders a red disk with center (395, 191) and radius 38 then Sets a single red pixel at (428, 72).
; PLAN: r0=393(x), r1=48(y), r2=18(width), r3=90(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=395(x), r6=191(y), r7=38(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=428(x), r11=72(y), r12=0xFF0000(color). Op: PSET r10, r11, r12.
LDI r0, 393
LDI r1, 48
LDI r2, 18
LDI r3, 90
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 395
LDI r6, 191
LDI r7, 38
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
LDI r10, 428
LDI r11, 72
LDI r12, 0xFF0000
PSET r10, r11, r12
HALT
