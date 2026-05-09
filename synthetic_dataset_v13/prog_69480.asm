; DESCRIPTION: Places a blue 63x96 rectangle at position (23, 136).
; PLAN: r0=23(x), r1=136(y), r2=63(width), r3=96(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 23
LDI r1, 136
LDI r2, 63
LDI r3, 96
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
