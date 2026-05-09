; DESCRIPTION: Places a black 11x42 rectangle at position (469, 128).
; PLAN: r0=469(x), r1=128(y), r2=11(width), r3=42(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 469
LDI r1, 128
LDI r2, 11
LDI r3, 42
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
