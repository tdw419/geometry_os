; DESCRIPTION: Places a black 120x74 rectangle at position (93, 45).
; PLAN: r0=93(x), r1=45(y), r2=120(width), r3=74(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 93
LDI r1, 45
LDI r2, 120
LDI r3, 74
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
