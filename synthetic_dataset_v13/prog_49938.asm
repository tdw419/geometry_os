; DESCRIPTION: Composite: Creates a purple rectangular region at (83, 174) spanning 81 by 62 pixels then Renders a red disk with center (171, 142) and radius 70 then Sets a single magenta pixel at (477, 143).
; PLAN: r0=83(x), r1=174(y), r2=81(width), r3=62(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=171(x), r6=142(y), r7=70(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=477(x), r11=143(y), r12=0xFF00FF(color). Op: PSET r10, r11, r12.
LDI r0, 83
LDI r1, 174
LDI r2, 81
LDI r3, 62
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 171
LDI r6, 142
LDI r7, 70
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
LDI r10, 477
LDI r11, 143
LDI r12, 0xFF00FF
PSET r10, r11, r12
HALT
