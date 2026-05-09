; DESCRIPTION: Places a blue 10x37 rectangle at position (476, 66).
; PLAN: r0=476(x), r1=66(y), r2=10(width), r3=37(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 476
LDI r1, 66
LDI r2, 10
LDI r3, 37
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
