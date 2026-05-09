; DESCRIPTION: Composite: Places a cyan 70x79 rectangle at position (238, 86) then Places a black dot at position (319, 189).
; PLAN: r0=238(x), r1=86(y), r2=70(width), r3=79(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=319(x), r6=189(y), r7=0x000000(color). Op: PSET r5, r6, r7.
LDI r0, 238
LDI r1, 86
LDI r2, 70
LDI r3, 79
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 319
LDI r6, 189
LDI r7, 0x000000
PSET r5, r6, r7
HALT
