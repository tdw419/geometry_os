; DESCRIPTION: Places a black 63x97 rectangle at position (64, 58).
; PLAN: r0=64(x), r1=58(y), r2=63(width), r3=97(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 64
LDI r1, 58
LDI r2, 63
LDI r3, 97
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
