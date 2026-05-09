; DESCRIPTION: Places a yellow 23x101 rectangle at position (137, 62).
; PLAN: r0=137(x), r1=62(y), r2=23(width), r3=101(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 137
LDI r1, 62
LDI r2, 23
LDI r3, 101
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
