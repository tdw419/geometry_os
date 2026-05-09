; DESCRIPTION: Places a blue 23x101 rectangle at position (142, 12).
; PLAN: r0=142(x), r1=12(y), r2=23(width), r3=101(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 142
LDI r1, 12
LDI r2, 23
LDI r3, 101
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
