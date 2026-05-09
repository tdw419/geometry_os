; DESCRIPTION: Composite: Creates a yellow rectangular region at (89, 154) spanning 101 by 38 pixels then Sets a single purple pixel at (20, 57) then Renders a black disk with center (399, 174) and radius 61.
; PLAN: r0=89(x), r1=154(y), r2=101(width), r3=38(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=20(x), r6=57(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7 Next: r10=399(x), r11=174(y), r12=61(radius), r13=0x000000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 89
LDI r1, 154
LDI r2, 101
LDI r3, 38
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 20
LDI r6, 57
LDI r7, 0xAA00FF
PSET r5, r6, r7
LDI r10, 399
LDI r11, 174
LDI r12, 61
LDI r13, 0x000000
CIRCLE r10, r11, r12, r13
HALT
