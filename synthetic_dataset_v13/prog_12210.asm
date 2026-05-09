; DESCRIPTION: Places a yellow 29x119 rectangle at position (133, 101).
; PLAN: r0=133(x), r1=101(y), r2=29(width), r3=119(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 133
LDI r1, 101
LDI r2, 29
LDI r3, 119
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
