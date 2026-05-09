; DESCRIPTION: Places a orange 19x73 rectangle at position (484, 30).
; PLAN: r0=484(x), r1=30(y), r2=19(width), r3=73(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 484
LDI r1, 30
LDI r2, 19
LDI r3, 73
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
