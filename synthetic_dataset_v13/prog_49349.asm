; DESCRIPTION: Places a orange 73x62 rectangle at position (93, 123).
; PLAN: r0=93(x), r1=123(y), r2=73(width), r3=62(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 93
LDI r1, 123
LDI r2, 73
LDI r3, 62
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
