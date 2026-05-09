; DESCRIPTION: Places a magenta 108x62 rectangle at position (257, 45).
; PLAN: r0=257(x), r1=45(y), r2=108(width), r3=62(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 257
LDI r1, 45
LDI r2, 108
LDI r3, 62
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
