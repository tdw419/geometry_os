; DESCRIPTION: Places a magenta 101x89 rectangle at position (1, 25).
; PLAN: r0=1(x), r1=25(y), r2=101(width), r3=89(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 1
LDI r1, 25
LDI r2, 101
LDI r3, 89
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
