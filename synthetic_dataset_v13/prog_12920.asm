; DESCRIPTION: Composite: Creates a white rectangular region at (1, 142) spanning 82 by 29 pixels then Sets a single red pixel at (270, 161) then Creates a yellow circular shape at (286, 126) with radius 64.
; PLAN: r0=1(x), r1=142(y), r2=82(width), r3=29(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=270(x), r6=161(y), r7=0xFF0000(color). Op: PSET r5, r6, r7 Next: r10=286(x), r11=126(y), r12=64(radius), r13=0xFFFF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 1
LDI r1, 142
LDI r2, 82
LDI r3, 29
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 270
LDI r6, 161
LDI r7, 0xFF0000
PSET r5, r6, r7
LDI r10, 286
LDI r11, 126
LDI r12, 64
LDI r13, 0xFFFF00
CIRCLE r10, r11, r12, r13
HALT
