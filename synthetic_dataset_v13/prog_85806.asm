; DESCRIPTION: Places a orange 11x49 rectangle at position (31, 31).
; PLAN: r0=31(x), r1=31(y), r2=11(width), r3=49(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 31
LDI r1, 31
LDI r2, 11
LDI r3, 49
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
