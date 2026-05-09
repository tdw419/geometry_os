; DESCRIPTION: Composite: Creates a green rectangular region at (383, 134) spanning 27 by 100 pixels then Sets a single red pixel at (191, 15).
; PLAN: r0=383(x), r1=134(y), r2=27(width), r3=100(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=191(x), r6=15(y), r7=0xFF0000(color). Op: PSET r5, r6, r7.
LDI r0, 383
LDI r1, 134
LDI r2, 27
LDI r3, 100
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 191
LDI r6, 15
LDI r7, 0xFF0000
PSET r5, r6, r7
HALT
