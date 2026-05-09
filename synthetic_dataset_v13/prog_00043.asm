; DESCRIPTION: Composite: Creates a orange rectangular region at (241, 48) spanning 16 by 25 pixels then Sets a single blue pixel at (73, 109).
; PLAN: r0=241(x), r1=48(y), r2=16(width), r3=25(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=73(x), r6=109(y), r7=0x0000FF(color). Op: PSET r5, r6, r7.
LDI r0, 241
LDI r1, 48
LDI r2, 16
LDI r3, 25
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 73
LDI r6, 109
LDI r7, 0x0000FF
PSET r5, r6, r7
HALT
