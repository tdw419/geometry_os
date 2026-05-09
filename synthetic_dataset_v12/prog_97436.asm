; DESCRIPTION: Places a orange 50x89 rectangle at position (254, 39).
; PLAN: r0=254(x), r1=39(y), r2=50(width), r3=89(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 254
LDI r1, 39
LDI r2, 50
LDI r3, 89
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
