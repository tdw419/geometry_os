; DESCRIPTION: Places a blue 76x118 rectangle at position (14, 77).
; PLAN: r0=14(x), r1=77(y), r2=76(width), r3=118(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 14
LDI r1, 77
LDI r2, 76
LDI r3, 118
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
