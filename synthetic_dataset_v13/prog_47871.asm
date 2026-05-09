; DESCRIPTION: Composite: Places a orange 113x73 rectangle at position (310, 134) then Sets a single purple pixel at (147, 131).
; PLAN: r0=310(x), r1=134(y), r2=113(width), r3=73(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=147(x), r6=131(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7.
LDI r0, 310
LDI r1, 134
LDI r2, 113
LDI r3, 73
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 147
LDI r6, 131
LDI r7, 0xAA00FF
PSET r5, r6, r7
HALT
