; DESCRIPTION: Composite: Creates a black rectangular region at (126, 113) spanning 98 by 109 pixels then Sets a single magenta pixel at (461, 92).
; PLAN: r0=126(x), r1=113(y), r2=98(width), r3=109(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=461(x), r6=92(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7.
LDI r0, 126
LDI r1, 113
LDI r2, 98
LDI r3, 109
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 461
LDI r6, 92
LDI r7, 0xFF00FF
PSET r5, r6, r7
HALT
