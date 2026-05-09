; DESCRIPTION: Places a blue 115x37 rectangle at position (22, 205).
; PLAN: r0=22(x), r1=205(y), r2=115(width), r3=37(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 22
LDI r1, 205
LDI r2, 115
LDI r3, 37
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
