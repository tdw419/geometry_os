; DESCRIPTION: Places a red 19x93 rectangle at position (257, 147).
; PLAN: r0=257(x), r1=147(y), r2=19(width), r3=93(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 257
LDI r1, 147
LDI r2, 19
LDI r3, 93
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
