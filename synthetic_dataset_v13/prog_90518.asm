; DESCRIPTION: Composite: Places a green 19x12 rectangle at position (56, 77) then Places a black dot at position (308, 156).
; PLAN: r0=56(x), r1=77(y), r2=19(width), r3=12(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=308(x), r6=156(y), r7=0x000000(color). Op: PSET r5, r6, r7.
LDI r0, 56
LDI r1, 77
LDI r2, 19
LDI r3, 12
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 308
LDI r6, 156
LDI r7, 0x000000
PSET r5, r6, r7
HALT
