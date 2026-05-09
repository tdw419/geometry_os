; DESCRIPTION: Places a magenta 116x60 rectangle at position (18, 69).
; PLAN: r0=18(x), r1=69(y), r2=116(width), r3=60(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 18
LDI r1, 69
LDI r2, 116
LDI r3, 60
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
