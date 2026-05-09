; DESCRIPTION: Places a purple 56x18 rectangle at position (397, 72).
; PLAN: r0=397(x), r1=72(y), r2=56(width), r3=18(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 397
LDI r1, 72
LDI r2, 56
LDI r3, 18
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
