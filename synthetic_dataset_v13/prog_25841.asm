; DESCRIPTION: Composite: Creates a magenta rectangular region at (108, 44) spanning 102 by 114 pixels then Sets a single cyan pixel at (267, 3).
; PLAN: r0=108(x), r1=44(y), r2=102(width), r3=114(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=267(x), r6=3(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7.
LDI r0, 108
LDI r1, 44
LDI r2, 102
LDI r3, 114
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 267
LDI r6, 3
LDI r7, 0x00FFFF
PSET r5, r6, r7
HALT
