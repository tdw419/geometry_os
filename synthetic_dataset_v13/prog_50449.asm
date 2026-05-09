; DESCRIPTION: Places a orange 78x58 rectangle at position (334, 5).
; PLAN: r0=334(x), r1=5(y), r2=78(width), r3=58(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 334
LDI r1, 5
LDI r2, 78
LDI r3, 58
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
