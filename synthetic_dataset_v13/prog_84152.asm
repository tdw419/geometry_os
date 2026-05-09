; DESCRIPTION: Places a black 64x66 rectangle at position (254, 129).
; PLAN: r0=254(x), r1=129(y), r2=64(width), r3=66(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 254
LDI r1, 129
LDI r2, 64
LDI r3, 66
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
