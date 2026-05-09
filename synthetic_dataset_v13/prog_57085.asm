; DESCRIPTION: Composite: Renders a white disk with center (394, 109) and radius 64 then Creates a orange rectangular region at (263, 217) spanning 119 by 36 pixels then Sets a single green pixel at (217, 134).
; PLAN: r0=394(x), r1=109(y), r2=64(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=263(x), r6=217(y), r7=119(width), r8=36(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=217(x), r11=134(y), r12=0x00FF00(color). Op: PSET r10, r11, r12.
LDI r0, 394
LDI r1, 109
LDI r2, 64
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 263
LDI r6, 217
LDI r7, 119
LDI r8, 36
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
LDI r10, 217
LDI r11, 134
LDI r12, 0x00FF00
PSET r10, r11, r12
HALT
