; DESCRIPTION: Renders a blue box of size 89x12 starting at (397, 87).
; PLAN: r0=397(x), r1=87(y), r2=89(width), r3=12(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 397
LDI r1, 87
LDI r2, 89
LDI r3, 12
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
