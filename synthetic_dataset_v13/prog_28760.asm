; DESCRIPTION: Composite: Creates a black rectangular region at (385, 174) spanning 46 by 29 pixels then Sets a single yellow pixel at (0, 87).
; PLAN: r0=385(x), r1=174(y), r2=46(width), r3=29(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=0(x), r6=87(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7.
LDI r0, 385
LDI r1, 174
LDI r2, 46
LDI r3, 29
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 0
LDI r6, 87
LDI r7, 0xFFFF00
PSET r5, r6, r7
HALT
