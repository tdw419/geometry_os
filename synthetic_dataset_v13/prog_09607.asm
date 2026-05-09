; DESCRIPTION: Places a magenta 74x81 rectangle at position (44, 105).
; PLAN: r0=44(x), r1=105(y), r2=74(width), r3=81(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 44
LDI r1, 105
LDI r2, 74
LDI r3, 81
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
