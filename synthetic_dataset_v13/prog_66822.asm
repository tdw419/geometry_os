; DESCRIPTION: Places a black 42x101 rectangle at position (267, 116).
; PLAN: r0=267(x), r1=116(y), r2=42(width), r3=101(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 267
LDI r1, 116
LDI r2, 42
LDI r3, 101
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
