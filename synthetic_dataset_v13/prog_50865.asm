; DESCRIPTION: Places a blue 66x119 rectangle at position (115, 5).
; PLAN: r0=115(x), r1=5(y), r2=66(width), r3=119(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 115
LDI r1, 5
LDI r2, 66
LDI r3, 119
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
