; DESCRIPTION: Places a purple 58x98 rectangle at position (257, 101).
; PLAN: r0=257(x), r1=101(y), r2=58(width), r3=98(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 257
LDI r1, 101
LDI r2, 58
LDI r3, 98
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
