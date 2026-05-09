; DESCRIPTION: Places a green 89x19 rectangle at position (343, 158).
; PLAN: r0=343(x), r1=158(y), r2=89(width), r3=19(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 343
LDI r1, 158
LDI r2, 89
LDI r3, 19
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
