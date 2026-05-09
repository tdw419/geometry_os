; DESCRIPTION: Places a black 100x30 rectangle at position (93, 108).
; PLAN: r0=93(x), r1=108(y), r2=100(width), r3=30(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 93
LDI r1, 108
LDI r2, 100
LDI r3, 30
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
