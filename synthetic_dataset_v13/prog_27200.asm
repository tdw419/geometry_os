; DESCRIPTION: Places a magenta 116x18 rectangle at position (58, 73).
; PLAN: r0=58(x), r1=73(y), r2=116(width), r3=18(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 58
LDI r1, 73
LDI r2, 116
LDI r3, 18
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
