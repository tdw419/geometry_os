; DESCRIPTION: Composite: Creates a orange rectangular region at (156, 125) spanning 51 by 70 pixels then Renders a red disk with center (359, 99) and radius 77 then Sets a single blue pixel at (147, 200).
; PLAN: r0=156(x), r1=125(y), r2=51(width), r3=70(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=359(x), r6=99(y), r7=77(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=147(x), r11=200(y), r12=0x0000FF(color). Op: PSET r10, r11, r12.
LDI r0, 156
LDI r1, 125
LDI r2, 51
LDI r3, 70
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 359
LDI r6, 99
LDI r7, 77
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
LDI r10, 147
LDI r11, 200
LDI r12, 0x0000FF
PSET r10, r11, r12
HALT
