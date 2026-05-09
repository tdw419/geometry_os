; DESCRIPTION: Places a orange 73x45 rectangle at position (366, 203).
; PLAN: r0=366(x), r1=203(y), r2=73(width), r3=45(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 366
LDI r1, 203
LDI r2, 73
LDI r3, 45
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
