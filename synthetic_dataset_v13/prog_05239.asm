; DESCRIPTION: Places a orange 23x120 rectangle at position (62, 63).
; PLAN: r0=62(x), r1=63(y), r2=23(width), r3=120(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 62
LDI r1, 63
LDI r2, 23
LDI r3, 120
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
