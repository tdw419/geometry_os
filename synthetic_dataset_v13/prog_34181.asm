; DESCRIPTION: Places a black 93x78 rectangle at position (13, 77).
; PLAN: r0=13(x), r1=77(y), r2=93(width), r3=78(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 13
LDI r1, 77
LDI r2, 93
LDI r3, 78
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
