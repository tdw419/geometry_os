; DESCRIPTION: Places a black 100x88 rectangle at position (329, 42).
; PLAN: r0=329(x), r1=42(y), r2=100(width), r3=88(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 329
LDI r1, 42
LDI r2, 100
LDI r3, 88
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
