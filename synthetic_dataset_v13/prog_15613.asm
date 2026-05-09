; DESCRIPTION: Places a orange 18x118 rectangle at position (10, 89).
; PLAN: r0=10(x), r1=89(y), r2=18(width), r3=118(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 10
LDI r1, 89
LDI r2, 18
LDI r3, 118
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
