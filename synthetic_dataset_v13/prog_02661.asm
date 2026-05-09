; DESCRIPTION: Composite: Creates a black rectangular region at (95, 47) spanning 46 by 40 pixels then Sets a single red pixel at (307, 49).
; PLAN: r0=95(x), r1=47(y), r2=46(width), r3=40(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=307(x), r6=49(y), r7=0xFF0000(color). Op: PSET r5, r6, r7.
LDI r0, 95
LDI r1, 47
LDI r2, 46
LDI r3, 40
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 307
LDI r6, 49
LDI r7, 0xFF0000
PSET r5, r6, r7
HALT
