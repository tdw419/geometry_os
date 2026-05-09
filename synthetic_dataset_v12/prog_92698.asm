; DESCRIPTION: Places a black 45x39 rectangle at position (227, 42).
; PLAN: r0=227(x), r1=42(y), r2=45(width), r3=39(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 227
LDI r1, 42
LDI r2, 45
LDI r3, 39
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
