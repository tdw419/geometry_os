; DESCRIPTION: Places a black 52x98 rectangle at position (114, 131).
; PLAN: r0=114(x), r1=131(y), r2=52(width), r3=98(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 114
LDI r1, 131
LDI r2, 52
LDI r3, 98
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
