; DESCRIPTION: Places a blue 114x65 rectangle at position (99, 88).
; PLAN: r0=99(x), r1=88(y), r2=114(width), r3=65(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 99
LDI r1, 88
LDI r2, 114
LDI r3, 65
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
