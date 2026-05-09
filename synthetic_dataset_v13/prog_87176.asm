; DESCRIPTION: Places a blue 26x101 rectangle at position (472, 1).
; PLAN: r0=472(x), r1=1(y), r2=26(width), r3=101(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 472
LDI r1, 1
LDI r2, 26
LDI r3, 101
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
