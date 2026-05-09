; DESCRIPTION: Places a orange 118x106 rectangle at position (232, 45).
; PLAN: r0=232(x), r1=45(y), r2=118(width), r3=106(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 232
LDI r1, 45
LDI r2, 118
LDI r3, 106
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
