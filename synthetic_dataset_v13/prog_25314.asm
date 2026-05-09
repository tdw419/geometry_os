; DESCRIPTION: Places a blue 63x118 rectangle at position (40, 53).
; PLAN: r0=40(x), r1=53(y), r2=63(width), r3=118(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 40
LDI r1, 53
LDI r2, 63
LDI r3, 118
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
