; DESCRIPTION: Composite: Creates a red rectangular region at (143, 100) spanning 82 by 90 pixels then Sets a single green pixel at (230, 5) then Creates a green circular shape at (409, 115) with radius 54.
; PLAN: r0=143(x), r1=100(y), r2=82(width), r3=90(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=230(x), r6=5(y), r7=0x00FF00(color). Op: PSET r5, r6, r7 Next: r10=409(x), r11=115(y), r12=54(radius), r13=0x00FF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 143
LDI r1, 100
LDI r2, 82
LDI r3, 90
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 230
LDI r6, 5
LDI r7, 0x00FF00
PSET r5, r6, r7
LDI r10, 409
LDI r11, 115
LDI r12, 54
LDI r13, 0x00FF00
CIRCLE r10, r11, r12, r13
HALT
