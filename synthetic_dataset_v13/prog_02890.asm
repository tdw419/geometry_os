; DESCRIPTION: Places a black 93x81 rectangle at position (89, 114).
; PLAN: r0=89(x), r1=114(y), r2=93(width), r3=81(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 89
LDI r1, 114
LDI r2, 93
LDI r3, 81
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
