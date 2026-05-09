; DESCRIPTION: Places a black 42x69 rectangle at position (449, 128).
; PLAN: r0=449(x), r1=128(y), r2=42(width), r3=69(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 449
LDI r1, 128
LDI r2, 42
LDI r3, 69
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
