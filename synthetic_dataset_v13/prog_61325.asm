; DESCRIPTION: Places a orange 52x101 rectangle at position (351, 132).
; PLAN: r0=351(x), r1=132(y), r2=52(width), r3=101(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 351
LDI r1, 132
LDI r2, 52
LDI r3, 101
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
