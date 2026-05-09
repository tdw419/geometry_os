; DESCRIPTION: Places a black 17x58 rectangle at position (308, 32).
; PLAN: r0=308(x), r1=32(y), r2=17(width), r3=58(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 308
LDI r1, 32
LDI r2, 17
LDI r3, 58
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
