; DESCRIPTION: Places a orange 114x31 rectangle at position (107, 194).
; PLAN: r0=107(x), r1=194(y), r2=114(width), r3=31(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 107
LDI r1, 194
LDI r2, 114
LDI r3, 31
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
