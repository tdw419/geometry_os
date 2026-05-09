; DESCRIPTION: Places a orange 66x101 rectangle at position (38, 155).
; PLAN: r0=38(x), r1=155(y), r2=66(width), r3=101(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 38
LDI r1, 155
LDI r2, 66
LDI r3, 101
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
