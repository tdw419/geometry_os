; DESCRIPTION: Places a blue 115x22 rectangle at position (376, 84).
; PLAN: r0=376(x), r1=84(y), r2=115(width), r3=22(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 376
LDI r1, 84
LDI r2, 115
LDI r3, 22
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
