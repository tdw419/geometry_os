; DESCRIPTION: Places a orange 101x38 rectangle at position (88, 87).
; PLAN: r0=88(x), r1=87(y), r2=101(width), r3=38(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 88
LDI r1, 87
LDI r2, 101
LDI r3, 38
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
