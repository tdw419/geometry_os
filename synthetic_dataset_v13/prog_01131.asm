; DESCRIPTION: Composite: Places a black circle of radius 47 at center (340, 128) then Creates a purple rectangular region at (151, 5) spanning 31 by 37 pixels then Sets a single yellow pixel at (90, 207).
; PLAN: r0=340(x), r1=128(y), r2=47(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=151(x), r6=5(y), r7=31(width), r8=37(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=90(x), r11=207(y), r12=0xFFFF00(color). Op: PSET r10, r11, r12.
LDI r0, 340
LDI r1, 128
LDI r2, 47
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 151
LDI r6, 5
LDI r7, 31
LDI r8, 37
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 90
LDI r11, 207
LDI r12, 0xFFFF00
PSET r10, r11, r12
HALT
