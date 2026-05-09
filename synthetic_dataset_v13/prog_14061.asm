; DESCRIPTION: Places a magenta 116x62 rectangle at position (195, 67).
; PLAN: r0=195(x), r1=67(y), r2=116(width), r3=62(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 195
LDI r1, 67
LDI r2, 116
LDI r3, 62
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
