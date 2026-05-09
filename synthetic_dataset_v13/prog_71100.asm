; DESCRIPTION: Places a orange 75x101 rectangle at position (31, 34).
; PLAN: r0=31(x), r1=34(y), r2=75(width), r3=101(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 31
LDI r1, 34
LDI r2, 75
LDI r3, 101
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
