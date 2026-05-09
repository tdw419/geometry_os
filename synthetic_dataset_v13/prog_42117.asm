; DESCRIPTION: Places a green 18x88 rectangle at position (490, 133).
; PLAN: r0=490(x), r1=133(y), r2=18(width), r3=88(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 490
LDI r1, 133
LDI r2, 18
LDI r3, 88
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
