; DESCRIPTION: Composite: Places a black 67x119 rectangle at position (120, 121) then Places a cyan dot at position (491, 105).
; PLAN: r0=120(x), r1=121(y), r2=67(width), r3=119(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=491(x), r6=105(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7.
LDI r0, 120
LDI r1, 121
LDI r2, 67
LDI r3, 119
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 491
LDI r6, 105
LDI r7, 0x00FFFF
PSET r5, r6, r7
HALT
