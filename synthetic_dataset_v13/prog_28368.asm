; DESCRIPTION: Composite: Creates a black rectangular region at (360, 148) spanning 114 by 103 pixels then Sets a single purple pixel at (394, 11).
; PLAN: r0=360(x), r1=148(y), r2=114(width), r3=103(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=394(x), r6=11(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7.
LDI r0, 360
LDI r1, 148
LDI r2, 114
LDI r3, 103
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 394
LDI r6, 11
LDI r7, 0xAA00FF
PSET r5, r6, r7
HALT
