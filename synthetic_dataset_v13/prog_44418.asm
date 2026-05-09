; DESCRIPTION: Composite: Creates a cyan rectangular region at (257, 219) spanning 45 by 12 pixels then Sets a single yellow pixel at (55, 126).
; PLAN: r0=257(x), r1=219(y), r2=45(width), r3=12(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=55(x), r6=126(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7.
LDI r0, 257
LDI r1, 219
LDI r2, 45
LDI r3, 12
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 55
LDI r6, 126
LDI r7, 0xFFFF00
PSET r5, r6, r7
HALT
