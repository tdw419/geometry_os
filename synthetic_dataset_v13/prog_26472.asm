; DESCRIPTION: Places a blue 25x66 rectangle at position (54, 131).
; PLAN: r0=54(x), r1=131(y), r2=25(width), r3=66(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 54
LDI r1, 131
LDI r2, 25
LDI r3, 66
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
