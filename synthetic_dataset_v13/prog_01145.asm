; DESCRIPTION: Places a yellow 16x106 rectangle at position (22, 26).
; PLAN: r0=22(x), r1=26(y), r2=16(width), r3=106(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 22
LDI r1, 26
LDI r2, 16
LDI r3, 106
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
