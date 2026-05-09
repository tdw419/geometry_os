; DESCRIPTION: Places a orange 37x88 rectangle at position (463, 122).
; PLAN: r0=463(x), r1=122(y), r2=37(width), r3=88(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 463
LDI r1, 122
LDI r2, 37
LDI r3, 88
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
