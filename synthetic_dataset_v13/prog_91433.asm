; DESCRIPTION: Composite: Places a purple 75x113 rectangle at position (211, 117) then Sets a single black pixel at (452, 140).
; PLAN: r0=211(x), r1=117(y), r2=75(width), r3=113(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=452(x), r6=140(y), r7=0x000000(color). Op: PSET r5, r6, r7.
LDI r0, 211
LDI r1, 117
LDI r2, 75
LDI r3, 113
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 452
LDI r6, 140
LDI r7, 0x000000
PSET r5, r6, r7
HALT
