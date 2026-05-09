; DESCRIPTION: Places a blue 66x101 rectangle at position (3, 18).
; PLAN: r0=3(x), r1=18(y), r2=66(width), r3=101(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 3
LDI r1, 18
LDI r2, 66
LDI r3, 101
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
