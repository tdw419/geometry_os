; DESCRIPTION: Places a black 66x89 rectangle at position (301, 37).
; PLAN: r0=301(x), r1=37(y), r2=66(width), r3=89(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 301
LDI r1, 37
LDI r2, 66
LDI r3, 89
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
