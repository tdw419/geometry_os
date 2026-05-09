; DESCRIPTION: Places a orange 94x13 rectangle at position (62, 234).
; PLAN: r0=62(x), r1=234(y), r2=94(width), r3=13(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 62
LDI r1, 234
LDI r2, 94
LDI r3, 13
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
