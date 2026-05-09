; DESCRIPTION: Places a orange 62x37 rectangle at position (87, 72).
; PLAN: r0=87(x), r1=72(y), r2=62(width), r3=37(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 87
LDI r1, 72
LDI r2, 62
LDI r3, 37
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
