; DESCRIPTION: Composite: Creates a magenta rectangular region at (161, 36) spanning 44 by 66 pixels then Sets a single magenta pixel at (279, 228).
; PLAN: r0=161(x), r1=36(y), r2=44(width), r3=66(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=279(x), r6=228(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7.
LDI r0, 161
LDI r1, 36
LDI r2, 44
LDI r3, 66
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 279
LDI r6, 228
LDI r7, 0xFF00FF
PSET r5, r6, r7
HALT
