; DESCRIPTION: Places a blue 115x43 rectangle at position (99, 130).
; PLAN: r0=99(x), r1=130(y), r2=115(width), r3=43(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 99
LDI r1, 130
LDI r2, 115
LDI r3, 43
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
