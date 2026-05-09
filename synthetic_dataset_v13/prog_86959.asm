; DESCRIPTION: Places a black 115x89 rectangle at position (318, 100).
; PLAN: r0=318(x), r1=100(y), r2=115(width), r3=89(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 318
LDI r1, 100
LDI r2, 115
LDI r3, 89
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
