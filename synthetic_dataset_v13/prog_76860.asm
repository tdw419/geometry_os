; DESCRIPTION: Composite: Creates a red rectangular region at (344, 37) spanning 71 by 116 pixels then Sets a single yellow pixel at (222, 189).
; PLAN: r0=344(x), r1=37(y), r2=71(width), r3=116(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=222(x), r6=189(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7.
LDI r0, 344
LDI r1, 37
LDI r2, 71
LDI r3, 116
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 222
LDI r6, 189
LDI r7, 0xFFFF00
PSET r5, r6, r7
HALT
