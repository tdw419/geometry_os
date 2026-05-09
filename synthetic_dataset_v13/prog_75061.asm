; DESCRIPTION: Places a magenta 81x105 rectangle at position (142, 61).
; PLAN: r0=142(x), r1=61(y), r2=81(width), r3=105(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 142
LDI r1, 61
LDI r2, 81
LDI r3, 105
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
