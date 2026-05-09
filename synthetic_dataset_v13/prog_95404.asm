; DESCRIPTION: Places a red 84x119 rectangle at position (257, 20).
; PLAN: r0=257(x), r1=20(y), r2=84(width), r3=119(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 257
LDI r1, 20
LDI r2, 84
LDI r3, 119
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
