; DESCRIPTION: Composite: Creates a red rectangular region at (178, 107) spanning 54 by 32 pixels then Sets a single black pixel at (172, 70).
; PLAN: r0=178(x), r1=107(y), r2=54(width), r3=32(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=172(x), r6=70(y), r7=0x000000(color). Op: PSET r5, r6, r7.
LDI r0, 178
LDI r1, 107
LDI r2, 54
LDI r3, 32
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 172
LDI r6, 70
LDI r7, 0x000000
PSET r5, r6, r7
HALT
