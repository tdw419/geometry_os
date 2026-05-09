; DESCRIPTION: Composite: Creates a black rectangular region at (179, 5) spanning 70 by 52 pixels then Sets a single orange pixel at (238, 38).
; PLAN: r0=179(x), r1=5(y), r2=70(width), r3=52(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=238(x), r6=38(y), r7=0xFF8800(color). Op: PSET r5, r6, r7.
LDI r0, 179
LDI r1, 5
LDI r2, 70
LDI r3, 52
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 238
LDI r6, 38
LDI r7, 0xFF8800
PSET r5, r6, r7
HALT
