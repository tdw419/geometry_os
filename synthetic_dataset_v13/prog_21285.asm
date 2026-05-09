; DESCRIPTION: Composite: Creates a black rectangular region at (147, 14) spanning 56 by 14 pixels then Sets a single cyan pixel at (53, 173).
; PLAN: r0=147(x), r1=14(y), r2=56(width), r3=14(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=53(x), r6=173(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7.
LDI r0, 147
LDI r1, 14
LDI r2, 56
LDI r3, 14
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 53
LDI r6, 173
LDI r7, 0x00FFFF
PSET r5, r6, r7
HALT
