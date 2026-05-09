; DESCRIPTION: Composite: Creates a orange rectangular region at (159, 34) spanning 44 by 37 pixels then Sets a single blue pixel at (27, 193).
; PLAN: r0=159(x), r1=34(y), r2=44(width), r3=37(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=27(x), r6=193(y), r7=0x0000FF(color). Op: PSET r5, r6, r7.
LDI r0, 159
LDI r1, 34
LDI r2, 44
LDI r3, 37
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 27
LDI r6, 193
LDI r7, 0x0000FF
PSET r5, r6, r7
HALT
