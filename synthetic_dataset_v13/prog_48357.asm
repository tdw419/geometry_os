; DESCRIPTION: Places a green 84x118 rectangle at position (148, 13).
; PLAN: r0=148(x), r1=13(y), r2=84(width), r3=118(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 148
LDI r1, 13
LDI r2, 84
LDI r3, 118
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
