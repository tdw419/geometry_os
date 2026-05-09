; DESCRIPTION: Places a red 45x30 rectangle at position (257, 106).
; PLAN: r0=257(x), r1=106(y), r2=45(width), r3=30(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 257
LDI r1, 106
LDI r2, 45
LDI r3, 30
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
