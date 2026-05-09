; DESCRIPTION: Composite: Places a orange 12x14 rectangle at position (423, 142) then Places a white dot at position (117, 226).
; PLAN: r0=423(x), r1=142(y), r2=12(width), r3=14(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=117(x), r6=226(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7.
LDI r0, 423
LDI r1, 142
LDI r2, 12
LDI r3, 14
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 117
LDI r6, 226
LDI r7, 0xFFFFFF
PSET r5, r6, r7
HALT
