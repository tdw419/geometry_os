; DESCRIPTION: Places a black 93x63 rectangle at position (257, 79).
; PLAN: r0=257(x), r1=79(y), r2=93(width), r3=63(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 257
LDI r1, 79
LDI r2, 93
LDI r3, 63
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
