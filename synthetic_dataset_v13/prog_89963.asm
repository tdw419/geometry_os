; DESCRIPTION: Places a orange 26x31 rectangle at position (6, 78).
; PLAN: r0=6(x), r1=78(y), r2=26(width), r3=31(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 6
LDI r1, 78
LDI r2, 26
LDI r3, 31
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
