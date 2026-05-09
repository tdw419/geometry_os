; DESCRIPTION: Composite: Creates a blue rectangular region at (131, 2) spanning 41 by 108 pixels then Sets a single green pixel at (187, 247).
; PLAN: r0=131(x), r1=2(y), r2=41(width), r3=108(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=187(x), r6=247(y), r7=0x00FF00(color). Op: PSET r5, r6, r7.
LDI r0, 131
LDI r1, 2
LDI r2, 41
LDI r3, 108
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 187
LDI r6, 247
LDI r7, 0x00FF00
PSET r5, r6, r7
HALT
