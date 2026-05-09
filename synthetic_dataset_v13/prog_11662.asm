; DESCRIPTION: Composite: Sets a single cyan pixel at (153, 240) then Renders a purple box of size 62x109 starting at (289, 125) then Renders a black disk with center (93, 105) and radius 20.
; PLAN: r0=153(x), r1=240(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=289(x), r6=125(y), r7=62(width), r8=109(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=93(x), r11=105(y), r12=20(radius), r13=0x000000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 153
LDI r1, 240
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 289
LDI r6, 125
LDI r7, 62
LDI r8, 109
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 93
LDI r11, 105
LDI r12, 20
LDI r13, 0x000000
CIRCLE r10, r11, r12, r13
HALT
