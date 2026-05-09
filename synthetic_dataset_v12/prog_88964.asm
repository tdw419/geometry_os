; DESCRIPTION: Composite: Creates a green rectangular region at (394, 145) spanning 21 by 110 pixels then Creates a white circular shape at (178, 176) with radius 35 then Places a black dot at position (374, 115).
; PLAN: r0=394(x), r1=145(y), r2=21(width), r3=110(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=178(x), r6=176(y), r7=35(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=374(x), r11=115(y), r12=0x000000(color). Op: PSET r10, r11, r12.
LDI r0, 394
LDI r1, 145
LDI r2, 21
LDI r3, 110
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 178
LDI r6, 176
LDI r7, 35
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
LDI r10, 374
LDI r11, 115
LDI r12, 0x000000
PSET r10, r11, r12
HALT
