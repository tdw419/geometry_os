; DESCRIPTION: Renders a blue box of size 64x119 starting at (231, 78).
; PLAN: r0=231(x), r1=78(y), r2=64(width), r3=119(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 231
LDI r1, 78
LDI r2, 64
LDI r3, 119
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
