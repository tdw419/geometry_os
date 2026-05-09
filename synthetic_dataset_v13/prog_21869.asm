; DESCRIPTION: Places a black 79x97 rectangle at position (32, 128).
; PLAN: r0=32(x), r1=128(y), r2=79(width), r3=97(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 32
LDI r1, 128
LDI r2, 79
LDI r3, 97
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
