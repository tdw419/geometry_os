; DESCRIPTION: Composite: Places a orange circle of radius 10 at center (466, 193) then Creates a white rectangular region at (288, 15) spanning 97 by 45 pixels then Sets a single black pixel at (18, 202).
; PLAN: r0=466(x), r1=193(y), r2=10(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=288(x), r6=15(y), r7=97(width), r8=45(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=18(x), r11=202(y), r12=0x000000(color). Op: PSET r10, r11, r12.
LDI r0, 466
LDI r1, 193
LDI r2, 10
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 288
LDI r6, 15
LDI r7, 97
LDI r8, 45
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 18
LDI r11, 202
LDI r12, 0x000000
PSET r10, r11, r12
HALT
