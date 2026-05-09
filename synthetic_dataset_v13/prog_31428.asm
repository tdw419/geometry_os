; DESCRIPTION: Composite: Places a orange 97x22 rectangle at position (89, 134) then Sets a single red pixel at (293, 64).
; PLAN: r0=89(x), r1=134(y), r2=97(width), r3=22(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=293(x), r6=64(y), r7=0xFF0000(color). Op: PSET r5, r6, r7.
LDI r0, 89
LDI r1, 134
LDI r2, 97
LDI r3, 22
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 293
LDI r6, 64
LDI r7, 0xFF0000
PSET r5, r6, r7
HALT
