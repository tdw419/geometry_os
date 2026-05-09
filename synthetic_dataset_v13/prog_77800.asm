; DESCRIPTION: Places a magenta 109x114 rectangle at position (78, 52).
; PLAN: r0=78(x), r1=52(y), r2=109(width), r3=114(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 78
LDI r1, 52
LDI r2, 109
LDI r3, 114
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
