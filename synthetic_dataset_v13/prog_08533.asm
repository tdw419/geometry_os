; DESCRIPTION: Places a magenta 105x114 rectangle at position (187, 136).
; PLAN: r0=187(x), r1=136(y), r2=105(width), r3=114(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 187
LDI r1, 136
LDI r2, 105
LDI r3, 114
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
