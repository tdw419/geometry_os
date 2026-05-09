; DESCRIPTION: Places a orange 114x66 rectangle at position (314, 2).
; PLAN: r0=314(x), r1=2(y), r2=114(width), r3=66(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 314
LDI r1, 2
LDI r2, 114
LDI r3, 66
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
