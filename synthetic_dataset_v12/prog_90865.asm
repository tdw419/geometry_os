; DESCRIPTION: Places a orange 97x44 rectangle at position (361, 10).
; PLAN: r0=361(x), r1=10(y), r2=97(width), r3=44(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 361
LDI r1, 10
LDI r2, 97
LDI r3, 44
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
