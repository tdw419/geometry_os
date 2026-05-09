; DESCRIPTION: Places a orange 116x60 rectangle at position (291, 58).
; PLAN: r0=291(x), r1=58(y), r2=116(width), r3=60(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 291
LDI r1, 58
LDI r2, 116
LDI r3, 60
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
