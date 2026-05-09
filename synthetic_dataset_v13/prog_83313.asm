; DESCRIPTION: Places a magenta 116x66 rectangle at position (85, 100).
; PLAN: r0=85(x), r1=100(y), r2=116(width), r3=66(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 85
LDI r1, 100
LDI r2, 116
LDI r3, 66
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
