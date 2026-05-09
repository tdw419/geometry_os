; DESCRIPTION: Places a blue 118x56 rectangle at position (312, 66).
; PLAN: r0=312(x), r1=66(y), r2=118(width), r3=56(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 312
LDI r1, 66
LDI r2, 118
LDI r3, 56
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
