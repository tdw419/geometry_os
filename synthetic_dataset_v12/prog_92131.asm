; DESCRIPTION: Composite: Sets a single black pixel at (492, 145) then Renders a yellow box of size 68x87 starting at (289, 78) then Renders a cyan disk with center (219, 163) and radius 71.
; PLAN: r0=492(x), r1=145(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=289(x), r6=78(y), r7=68(width), r8=87(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=219(x), r11=163(y), r12=71(radius), r13=0x00FFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 492
LDI r1, 145
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 289
LDI r6, 78
LDI r7, 68
LDI r8, 87
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
LDI r10, 219
LDI r11, 163
LDI r12, 71
LDI r13, 0x00FFFF
CIRCLE r10, r11, r12, r13
HALT
