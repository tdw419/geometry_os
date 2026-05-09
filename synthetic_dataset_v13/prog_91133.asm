; DESCRIPTION: Places a black 17x101 rectangle at position (397, 109).
; PLAN: r0=397(x), r1=109(y), r2=17(width), r3=101(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 397
LDI r1, 109
LDI r2, 17
LDI r3, 101
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
