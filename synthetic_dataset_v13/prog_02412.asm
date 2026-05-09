; DESCRIPTION: Composite: Creates a magenta rectangular region at (82, 198) spanning 51 by 27 pixels then Sets a single white pixel at (390, 84).
; PLAN: r0=82(x), r1=198(y), r2=51(width), r3=27(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=390(x), r6=84(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7.
LDI r0, 82
LDI r1, 198
LDI r2, 51
LDI r3, 27
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 390
LDI r6, 84
LDI r7, 0xFFFFFF
PSET r5, r6, r7
HALT
