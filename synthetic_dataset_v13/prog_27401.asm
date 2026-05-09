; DESCRIPTION: Composite: Creates a red rectangular region at (449, 9) spanning 33 by 16 pixels then Sets a single orange pixel at (66, 218) then Renders a red disk with center (424, 176) and radius 49.
; PLAN: r0=449(x), r1=9(y), r2=33(width), r3=16(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=66(x), r6=218(y), r7=0xFF8800(color). Op: PSET r5, r6, r7 Next: r10=424(x), r11=176(y), r12=49(radius), r13=0xFF0000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 449
LDI r1, 9
LDI r2, 33
LDI r3, 16
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 66
LDI r6, 218
LDI r7, 0xFF8800
PSET r5, r6, r7
LDI r10, 424
LDI r11, 176
LDI r12, 49
LDI r13, 0xFF0000
CIRCLE r10, r11, r12, r13
HALT
