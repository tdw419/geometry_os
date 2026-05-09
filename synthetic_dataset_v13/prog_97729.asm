; DESCRIPTION: Places a orange 89x35 rectangle at position (64, 149).
; PLAN: r0=64(x), r1=149(y), r2=89(width), r3=35(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 64
LDI r1, 149
LDI r2, 89
LDI r3, 35
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
