; DESCRIPTION: Composite: Creates a blue rectangular region at (376, 131) spanning 53 by 112 pixels then Sets a single red pixel at (218, 191).
; PLAN: r0=376(x), r1=131(y), r2=53(width), r3=112(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=218(x), r6=191(y), r7=0xFF0000(color). Op: PSET r5, r6, r7.
LDI r0, 376
LDI r1, 131
LDI r2, 53
LDI r3, 112
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 218
LDI r6, 191
LDI r7, 0xFF0000
PSET r5, r6, r7
HALT
