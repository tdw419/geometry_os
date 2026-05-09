; DESCRIPTION: Places a orange 62x119 rectangle at position (144, 23).
; PLAN: r0=144(x), r1=23(y), r2=62(width), r3=119(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 144
LDI r1, 23
LDI r2, 62
LDI r3, 119
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
