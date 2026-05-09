; DESCRIPTION: Places a magenta 81x61 rectangle at position (291, 194).
; PLAN: r0=291(x), r1=194(y), r2=81(width), r3=61(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 291
LDI r1, 194
LDI r2, 81
LDI r3, 61
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
