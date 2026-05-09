; DESCRIPTION: Places a orange 97x26 rectangle at position (63, 173).
; PLAN: r0=63(x), r1=173(y), r2=97(width), r3=26(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 63
LDI r1, 173
LDI r2, 97
LDI r3, 26
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
