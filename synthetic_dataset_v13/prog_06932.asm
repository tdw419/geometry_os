; DESCRIPTION: Composite: Creates a blue rectangular region at (18, 60) spanning 27 by 36 pixels then Sets a single yellow pixel at (342, 13).
; PLAN: r0=18(x), r1=60(y), r2=27(width), r3=36(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=342(x), r6=13(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7.
LDI r0, 18
LDI r1, 60
LDI r2, 27
LDI r3, 36
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 342
LDI r6, 13
LDI r7, 0xFFFF00
PSET r5, r6, r7
HALT
