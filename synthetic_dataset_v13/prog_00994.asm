; DESCRIPTION: Places a orange 29x97 rectangle at position (18, 15).
; PLAN: r0=18(x), r1=15(y), r2=29(width), r3=97(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 18
LDI r1, 15
LDI r2, 29
LDI r3, 97
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
