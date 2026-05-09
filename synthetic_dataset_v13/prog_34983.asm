; DESCRIPTION: Places a blue 63x11 rectangle at position (449, 100).
; PLAN: r0=449(x), r1=100(y), r2=63(width), r3=11(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 449
LDI r1, 100
LDI r2, 63
LDI r3, 11
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
