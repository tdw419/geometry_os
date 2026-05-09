; DESCRIPTION: Composite: Places a orange 103x89 rectangle at position (26, 24) then Places a blue dot at position (226, 119).
; PLAN: r0=26(x), r1=24(y), r2=103(width), r3=89(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=226(x), r6=119(y), r7=0x0000FF(color). Op: PSET r5, r6, r7.
LDI r0, 26
LDI r1, 24
LDI r2, 103
LDI r3, 89
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 226
LDI r6, 119
LDI r7, 0x0000FF
PSET r5, r6, r7
HALT
