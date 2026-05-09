; DESCRIPTION: Composite: Creates a orange rectangular region at (132, 94) spanning 30 by 46 pixels then Sets a single white pixel at (58, 53).
; PLAN: r0=132(x), r1=94(y), r2=30(width), r3=46(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=58(x), r6=53(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7.
LDI r0, 132
LDI r1, 94
LDI r2, 30
LDI r3, 46
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 58
LDI r6, 53
LDI r7, 0xFFFFFF
PSET r5, r6, r7
HALT
