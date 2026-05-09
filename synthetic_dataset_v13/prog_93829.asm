; DESCRIPTION: Composite: Creates a blue rectangular region at (399, 17) spanning 94 by 89 pixels then Renders a red disk with center (430, 140) and radius 68 then Sets a single red pixel at (221, 214).
; PLAN: r0=399(x), r1=17(y), r2=94(width), r3=89(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=430(x), r6=140(y), r7=68(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=221(x), r11=214(y), r12=0xFF0000(color). Op: PSET r10, r11, r12.
LDI r0, 399
LDI r1, 17
LDI r2, 94
LDI r3, 89
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 430
LDI r6, 140
LDI r7, 68
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
LDI r10, 221
LDI r11, 214
LDI r12, 0xFF0000
PSET r10, r11, r12
HALT
