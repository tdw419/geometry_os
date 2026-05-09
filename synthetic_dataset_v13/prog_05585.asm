; DESCRIPTION: Composite: Places a purple 97x99 rectangle at position (53, 78) then Sets a single purple pixel at (155, 171).
; PLAN: r0=53(x), r1=78(y), r2=97(width), r3=99(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=155(x), r6=171(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7.
LDI r0, 53
LDI r1, 78
LDI r2, 97
LDI r3, 99
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 155
LDI r6, 171
LDI r7, 0xAA00FF
PSET r5, r6, r7
HALT
