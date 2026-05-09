; DESCRIPTION: Places a orange 89x119 rectangle at position (261, 13).
; PLAN: r0=261(x), r1=13(y), r2=89(width), r3=119(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 261
LDI r1, 13
LDI r2, 89
LDI r3, 119
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
