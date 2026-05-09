; DESCRIPTION: Composite: Creates a yellow rectangular region at (267, 42) spanning 18 by 19 pixels then Sets a single purple pixel at (158, 223).
; PLAN: r0=267(x), r1=42(y), r2=18(width), r3=19(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=158(x), r6=223(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7.
LDI r0, 267
LDI r1, 42
LDI r2, 18
LDI r3, 19
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 158
LDI r6, 223
LDI r7, 0xAA00FF
PSET r5, r6, r7
HALT
