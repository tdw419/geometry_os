; DESCRIPTION: Composite: Places a orange 31x79 rectangle at position (334, 151) then Places a white dot at position (230, 67).
; PLAN: r0=334(x), r1=151(y), r2=31(width), r3=79(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=230(x), r6=67(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7.
LDI r0, 334
LDI r1, 151
LDI r2, 31
LDI r3, 79
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 230
LDI r6, 67
LDI r7, 0xFFFFFF
PSET r5, r6, r7
HALT
