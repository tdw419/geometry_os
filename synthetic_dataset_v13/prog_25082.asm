; DESCRIPTION: Places a orange 84x36 rectangle at position (345, 78).
; PLAN: r0=345(x), r1=78(y), r2=84(width), r3=36(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 345
LDI r1, 78
LDI r2, 84
LDI r3, 36
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
