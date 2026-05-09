; DESCRIPTION: Composite: Creates a green rectangular region at (399, 164) spanning 13 by 10 pixels then Sets a single white pixel at (4, 157).
; PLAN: r0=399(x), r1=164(y), r2=13(width), r3=10(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=4(x), r6=157(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7.
LDI r0, 399
LDI r1, 164
LDI r2, 13
LDI r3, 10
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 4
LDI r6, 157
LDI r7, 0xFFFFFF
PSET r5, r6, r7
HALT
