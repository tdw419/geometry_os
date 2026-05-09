; DESCRIPTION: Places a orange 101x114 rectangle at position (23, 47).
; PLAN: r0=23(x), r1=47(y), r2=101(width), r3=114(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 23
LDI r1, 47
LDI r2, 101
LDI r3, 114
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
