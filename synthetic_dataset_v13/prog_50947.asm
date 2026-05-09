; DESCRIPTION: Places a blue 119x33 rectangle at position (257, 36).
; PLAN: r0=257(x), r1=36(y), r2=119(width), r3=33(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 257
LDI r1, 36
LDI r2, 119
LDI r3, 33
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
