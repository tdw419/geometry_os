; DESCRIPTION: Composite: Creates a black rectangular region at (247, 145) spanning 93 by 35 pixels then Sets a single magenta pixel at (128, 199).
; PLAN: r0=247(x), r1=145(y), r2=93(width), r3=35(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=128(x), r6=199(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7.
LDI r0, 247
LDI r1, 145
LDI r2, 93
LDI r3, 35
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 128
LDI r6, 199
LDI r7, 0xFF00FF
PSET r5, r6, r7
HALT
