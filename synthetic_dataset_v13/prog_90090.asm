; DESCRIPTION: Places a orange 100x62 rectangle at position (311, 106).
; PLAN: r0=311(x), r1=106(y), r2=100(width), r3=62(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 311
LDI r1, 106
LDI r2, 100
LDI r3, 62
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
