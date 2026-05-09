; DESCRIPTION: Composite: Creates a green rectangular region at (348, 99) spanning 45 by 31 pixels then Places a black dot at position (504, 51).
; PLAN: r0=348(x), r1=99(y), r2=45(width), r3=31(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=504(x), r6=51(y), r7=0x000000(color). Op: PSET r5, r6, r7.
LDI r0, 348
LDI r1, 99
LDI r2, 45
LDI r3, 31
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 504
LDI r6, 51
LDI r7, 0x000000
PSET r5, r6, r7
HALT
