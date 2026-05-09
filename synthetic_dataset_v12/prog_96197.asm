; DESCRIPTION: Places a orange 65x89 rectangle at position (31, 74).
; PLAN: r0=31(x), r1=74(y), r2=65(width), r3=89(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 31
LDI r1, 74
LDI r2, 65
LDI r3, 89
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
