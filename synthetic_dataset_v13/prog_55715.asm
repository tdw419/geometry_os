; DESCRIPTION: Places a magenta 74x114 rectangle at position (329, 92).
; PLAN: r0=329(x), r1=92(y), r2=74(width), r3=114(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 329
LDI r1, 92
LDI r2, 74
LDI r3, 114
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
