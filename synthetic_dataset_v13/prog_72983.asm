; DESCRIPTION: Places a orange 66x56 rectangle at position (26, 133).
; PLAN: r0=26(x), r1=133(y), r2=66(width), r3=56(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 26
LDI r1, 133
LDI r2, 66
LDI r3, 56
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
