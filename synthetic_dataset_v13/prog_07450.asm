; DESCRIPTION: Composite: Creates a yellow rectangular region at (377, 151) spanning 106 by 33 pixels then Places a purple dot at position (405, 116).
; PLAN: r0=377(x), r1=151(y), r2=106(width), r3=33(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=405(x), r6=116(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7.
LDI r0, 377
LDI r1, 151
LDI r2, 106
LDI r3, 33
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 405
LDI r6, 116
LDI r7, 0xAA00FF
PSET r5, r6, r7
HALT
