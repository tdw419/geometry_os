; DESCRIPTION: Composite: Creates a magenta rectangular region at (358, 9) spanning 110 by 96 pixels then Sets a single purple pixel at (403, 83).
; PLAN: r0=358(x), r1=9(y), r2=110(width), r3=96(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=403(x), r6=83(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7.
LDI r0, 358
LDI r1, 9
LDI r2, 110
LDI r3, 96
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 403
LDI r6, 83
LDI r7, 0xAA00FF
PSET r5, r6, r7
HALT
