; DESCRIPTION: Places a yellow 76x89 rectangle at position (257, 5).
; PLAN: r0=257(x), r1=5(y), r2=76(width), r3=89(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 257
LDI r1, 5
LDI r2, 76
LDI r3, 89
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
