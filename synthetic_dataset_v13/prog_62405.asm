; DESCRIPTION: Places a black 57x93 rectangle at position (47, 18).
; PLAN: r0=47(x), r1=18(y), r2=57(width), r3=93(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 47
LDI r1, 18
LDI r2, 57
LDI r3, 93
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
