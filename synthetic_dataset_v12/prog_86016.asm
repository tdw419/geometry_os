; DESCRIPTION: Places a magenta 116x28 rectangle at position (3, 84).
; PLAN: r0=3(x), r1=84(y), r2=116(width), r3=28(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 3
LDI r1, 84
LDI r2, 116
LDI r3, 28
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
