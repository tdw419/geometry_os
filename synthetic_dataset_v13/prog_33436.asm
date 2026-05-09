; DESCRIPTION: Places a green 63x106 rectangle at position (101, 26).
; PLAN: r0=101(x), r1=26(y), r2=63(width), r3=106(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 101
LDI r1, 26
LDI r2, 63
LDI r3, 106
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
