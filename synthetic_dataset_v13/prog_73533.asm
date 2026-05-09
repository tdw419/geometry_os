; DESCRIPTION: Composite: Creates a red rectangular region at (390, 136) spanning 44 by 77 pixels then Sets a single white pixel at (167, 36).
; PLAN: r0=390(x), r1=136(y), r2=44(width), r3=77(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=167(x), r6=36(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7.
LDI r0, 390
LDI r1, 136
LDI r2, 44
LDI r3, 77
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 167
LDI r6, 36
LDI r7, 0xFFFFFF
PSET r5, r6, r7
HALT
