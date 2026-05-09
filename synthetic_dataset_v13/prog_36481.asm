; DESCRIPTION: Places a magenta 116x10 rectangle at position (155, 3).
; PLAN: r0=155(x), r1=3(y), r2=116(width), r3=10(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 155
LDI r1, 3
LDI r2, 116
LDI r3, 10
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
