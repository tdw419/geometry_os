; DESCRIPTION: Places a orange 116x101 rectangle at position (64, 8).
; PLAN: r0=64(x), r1=8(y), r2=116(width), r3=101(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 64
LDI r1, 8
LDI r2, 116
LDI r3, 101
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
