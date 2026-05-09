; DESCRIPTION: Composite: Creates a orange rectangular region at (370, 169) spanning 116 by 27 pixels then Sets a single yellow pixel at (257, 253).
; PLAN: r0=370(x), r1=169(y), r2=116(width), r3=27(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=257(x), r6=253(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7.
LDI r0, 370
LDI r1, 169
LDI r2, 116
LDI r3, 27
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 257
LDI r6, 253
LDI r7, 0xFFFF00
PSET r5, r6, r7
HALT
