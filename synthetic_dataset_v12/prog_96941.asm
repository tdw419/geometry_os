; DESCRIPTION: Places a orange 89x26 rectangle at position (159, 137).
; PLAN: r0=159(x), r1=137(y), r2=89(width), r3=26(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 159
LDI r1, 137
LDI r2, 89
LDI r3, 26
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
