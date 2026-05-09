; DESCRIPTION: Composite: Places a cyan 51x109 rectangle at position (8, 72) then Places a white dot at position (478, 212).
; PLAN: r0=8(x), r1=72(y), r2=51(width), r3=109(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=478(x), r6=212(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7.
LDI r0, 8
LDI r1, 72
LDI r2, 51
LDI r3, 109
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 478
LDI r6, 212
LDI r7, 0xFFFFFF
PSET r5, r6, r7
HALT
