; DESCRIPTION: Places a black 74x93 rectangle at position (221, 131).
; PLAN: r0=221(x), r1=131(y), r2=74(width), r3=93(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 221
LDI r1, 131
LDI r2, 74
LDI r3, 93
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
