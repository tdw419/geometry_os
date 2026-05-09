; DESCRIPTION: Places a black 89x61 rectangle at position (343, 126).
; PLAN: r0=343(x), r1=126(y), r2=89(width), r3=61(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 343
LDI r1, 126
LDI r2, 89
LDI r3, 61
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
