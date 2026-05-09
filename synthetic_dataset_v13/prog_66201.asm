; DESCRIPTION: Composite: Places a purple 25x93 rectangle at position (185, 132) then Places a orange dot at position (289, 88).
; PLAN: r0=185(x), r1=132(y), r2=25(width), r3=93(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=289(x), r6=88(y), r7=0xFF8800(color). Op: PSET r5, r6, r7.
LDI r0, 185
LDI r1, 132
LDI r2, 25
LDI r3, 93
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 289
LDI r6, 88
LDI r7, 0xFF8800
PSET r5, r6, r7
HALT
