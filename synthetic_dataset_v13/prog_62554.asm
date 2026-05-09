; DESCRIPTION: Places a black 45x89 rectangle at position (100, 57).
; PLAN: r0=100(x), r1=57(y), r2=45(width), r3=89(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 100
LDI r1, 57
LDI r2, 45
LDI r3, 89
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
