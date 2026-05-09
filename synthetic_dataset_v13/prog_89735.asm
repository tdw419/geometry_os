; DESCRIPTION: Places a yellow 85x101 rectangle at position (138, 43).
; PLAN: r0=138(x), r1=43(y), r2=85(width), r3=101(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 138
LDI r1, 43
LDI r2, 85
LDI r3, 101
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
