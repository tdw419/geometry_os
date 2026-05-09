; DESCRIPTION: Places a blue 64x119 rectangle at position (432, 7).
; PLAN: r0=432(x), r1=7(y), r2=64(width), r3=119(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 432
LDI r1, 7
LDI r2, 64
LDI r3, 119
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
