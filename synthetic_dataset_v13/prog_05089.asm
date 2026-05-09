; DESCRIPTION: Places a white 64x31 rectangle at position (397, 201).
; PLAN: r0=397(x), r1=201(y), r2=64(width), r3=31(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 397
LDI r1, 201
LDI r2, 64
LDI r3, 31
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
