; DESCRIPTION: Places a blue 66x114 rectangle at position (354, 136).
; PLAN: r0=354(x), r1=136(y), r2=66(width), r3=114(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 354
LDI r1, 136
LDI r2, 66
LDI r3, 114
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
