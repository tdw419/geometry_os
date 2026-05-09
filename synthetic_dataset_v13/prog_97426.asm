; DESCRIPTION: Places a orange 81x23 rectangle at position (3, 11).
; PLAN: r0=3(x), r1=11(y), r2=81(width), r3=23(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 3
LDI r1, 11
LDI r2, 81
LDI r3, 23
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
