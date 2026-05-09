; DESCRIPTION: Composite: Creates a green rectangular region at (127, 114) spanning 93 by 116 pixels then Sets a single green pixel at (208, 155).
; PLAN: r0=127(x), r1=114(y), r2=93(width), r3=116(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=208(x), r6=155(y), r7=0x00FF00(color). Op: PSET r5, r6, r7.
LDI r0, 127
LDI r1, 114
LDI r2, 93
LDI r3, 116
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 208
LDI r6, 155
LDI r7, 0x00FF00
PSET r5, r6, r7
HALT
