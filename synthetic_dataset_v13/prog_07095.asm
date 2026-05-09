; DESCRIPTION: Places a blue 88x23 rectangle at position (327, 63).
; PLAN: r0=327(x), r1=63(y), r2=88(width), r3=23(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 327
LDI r1, 63
LDI r2, 88
LDI r3, 23
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
