; DESCRIPTION: Composite: Places a orange 32x14 rectangle at position (18, 85) then Places a white dot at position (423, 87).
; PLAN: r0=18(x), r1=85(y), r2=32(width), r3=14(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=423(x), r6=87(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7.
LDI r0, 18
LDI r1, 85
LDI r2, 32
LDI r3, 14
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 423
LDI r6, 87
LDI r7, 0xFFFFFF
PSET r5, r6, r7
HALT
