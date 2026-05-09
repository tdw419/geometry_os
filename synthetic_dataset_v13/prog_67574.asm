; DESCRIPTION: Places a blue 71x107 rectangle at position (158, 35).
; PLAN: r0=158(x), r1=35(y), r2=71(width), r3=107(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 158
LDI r1, 35
LDI r2, 71
LDI r3, 107
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
