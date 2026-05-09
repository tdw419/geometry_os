; DESCRIPTION: Places a blue 76x118 rectangle at position (312, 26).
; PLAN: r0=312(x), r1=26(y), r2=76(width), r3=118(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 312
LDI r1, 26
LDI r2, 76
LDI r3, 118
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
