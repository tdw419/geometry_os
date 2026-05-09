; DESCRIPTION: Places a magenta 116x14 rectangle at position (42, 7).
; PLAN: r0=42(x), r1=7(y), r2=116(width), r3=14(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 42
LDI r1, 7
LDI r2, 116
LDI r3, 14
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
