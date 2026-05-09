; DESCRIPTION: Places a blue 10x63 rectangle at position (64, 116).
; PLAN: r0=64(x), r1=116(y), r2=10(width), r3=63(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 64
LDI r1, 116
LDI r2, 10
LDI r3, 63
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
